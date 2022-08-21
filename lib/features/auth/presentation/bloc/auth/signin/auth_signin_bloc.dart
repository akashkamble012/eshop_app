import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/common/common_message.dart';
import '../../../../../../core/error/success.dart';
import 'package:formz/formz.dart';

import '../../../../domain/usecases/login.dart';
import '../../models/email.dart';
import '../../models/password.dart';

part 'auth_signin_event.dart';
part 'auth_signin_state.dart';

class AuthSigninBloc extends Bloc<AuthSigninEvent, AuthSigninState> {
  final Login _login;
  AuthSigninBloc(this._login) : super(const AuthSigninState()) {
    on<EmailChangeSigninEvent>(__emailChangeSigninEvent);
    on<PasswordChangeSigninEvent>(__passwordChangeSigninEvent);
    on<AuthSigninButtonEvent>(__authSigninButtonEvent);
  }

  void __emailChangeSigninEvent(EmailChangeSigninEvent event, emit) {
    final email = Email.dirty(value: event.emaild ?? '');
    print('---- $event');
    emit(
      state.copyWith(
        email: email,
        formzStatus: Formz.validate([email, state.password]),
      ),
    );
  }

  void __passwordChangeSigninEvent(PasswordChangeSigninEvent event, emit) {
    final password = Password.dirty(value: event.password ?? '');
    emit(
      state.copyWith(
        password: password,
        formzStatus: Formz.validate([password, state.email]),
      ),
    );
  }

  void __authSigninButtonEvent(AuthSigninButtonEvent event, emit) async {
    print('==== Auth $state');
    if (state.formzStatus.isValid) {
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      final result = await _login(emailId: state.email.value, passWord: state.password.value);
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
