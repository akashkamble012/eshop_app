part of 'auth_signin_bloc.dart';

abstract class AuthSigninEvent extends Equatable {
  const AuthSigninEvent();
}

class EmailChangeSigninEvent extends AuthSigninEvent {
  final String? emaild;
  const EmailChangeSigninEvent(this.emaild);
  @override
  List<Object?> get props => [emaild];
}

class PasswordChangeSigninEvent extends AuthSigninEvent {
  final String? password;
  const PasswordChangeSigninEvent(this.password);
  @override
  List<Object?> get props => [password];
}

class AuthSigninButtonEvent extends AuthSigninEvent {
  const AuthSigninButtonEvent();
  @override
  List<Object?> get props => [];
}
