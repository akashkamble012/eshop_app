import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../../common/common_message.dart';
import '../../../../domain/usecases/create_user.dart';
import '../../models/email.dart';
import '../../models/password.dart';

part 'auth_signup_event.dart';
part 'auth_signup_state.dart';

class AuthSignupBloc extends Bloc<AuthSignupEvent, AuthSignupState> {
  final CreateUser _createUser;
  AuthSignupBloc(this._createUser) : super(const AuthSignupState()) {
    on<EmailChangeSignupEvent>(emailChangeSignupEvent);
    on<PasswordChangeSignupEvent>(passwordChangeSignupEvent);
    on<AuthSignupButtonEvent>(authSigniupButtonEvent);
    on<ConfirmPasswordChangeSignupEvent>(confirmPasswordChangeSignupEvent);
  }

  void emailChangeSignupEvent(EmailChangeSignupEvent event, emit) {
    final email = Email.dirty(value: event.emaild ?? '');
    print('---- $event');
    emit(
      state.copyWith(
        email: email,
        formzStatus: Formz.validate([email, state.password, state.confirmPassword]),
      ),
    );
  }

  void passwordChangeSignupEvent(PasswordChangeSignupEvent event, emit) {
    final password = Password.dirty(value: event.password ?? '');
    
    emit(
      state.copyWith(
        password: password,
        formzStatus: Formz.validate([password, state.email, state.confirmPassword]),
      ),
    );
  }

  void confirmPasswordChangeSignupEvent(ConfirmPasswordChangeSignupEvent event, emit) {
    final confirmPassword = Password.dirty(value: event.password ?? '');

    if (event.password != state.password.value) {
      emit(state.copyWith(formzStatus: FormzStatus.invalid, message: 'Confirm password is not same'));
      return;
    }
    emit(state.copyWith(
        formzStatus: Formz.validate([confirmPassword, state.password, state.email]), confirmPassword: confirmPassword));
  }

  void authSigniupButtonEvent(AuthSignupButtonEvent event, emit) async {
    if (state.formzStatus.isValid) {
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      final result = await _createUser(emailId: state.email.value, passWord: state.password.value, userName: '');
      print('Result -$result');
      result.fold((failure) {
        emit(state.copyWith(formzStatus: FormzStatus.submissionFailure, message: failure.message));
        return;
      }, (success) {
        emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess, message: success.message));
        return;
      });
    } else {
      emit(state.copyWith(
        formzStatus: FormzStatus.submissionFailure,
        message: CommonMessage.somethingwentWrong,
      ));
    }
  }
}
