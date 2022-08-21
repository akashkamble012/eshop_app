part of 'auth_signin_bloc.dart';

class AuthSigninState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus formzStatus;
  final String message;
  const AuthSigninState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formzStatus = FormzStatus.pure,
    this.message = '',
  });

  AuthSigninState copyWith({
    Email? email,
    Password? password,
    FormzStatus? formzStatus,
    String? message,
  }) {
    return AuthSigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      formzStatus: formzStatus ?? this.formzStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, formzStatus, message];
}
