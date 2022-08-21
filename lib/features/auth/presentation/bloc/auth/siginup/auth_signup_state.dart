part of 'auth_signup_bloc.dart';

class AuthSignupState extends Equatable {
  final Email email;
  final Password password;
  final Password confirmPassword;
  final FormzStatus formzStatus;
  final String message;
  const AuthSignupState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.formzStatus = FormzStatus.pure,
    this.message = '',
  });

  AuthSignupState copyWith(
      {Email? email, Password? password, Password? confirmPassword, FormzStatus? formzStatus, String? message}) {
    return AuthSignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formzStatus: formzStatus ?? this.formzStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, formzStatus, confirmPassword, message];
}
