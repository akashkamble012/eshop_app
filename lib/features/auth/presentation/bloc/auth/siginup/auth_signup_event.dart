part of 'auth_signup_bloc.dart';

abstract class AuthSignupEvent extends Equatable {
  const AuthSignupEvent();
}

class EmailChangeSignupEvent extends AuthSignupEvent {
  final String? emaild;
  const EmailChangeSignupEvent(this.emaild);
  @override
  List<Object?> get props => [emaild];
}

class PasswordChangeSignupEvent extends AuthSignupEvent {
  final String? password;
  const PasswordChangeSignupEvent(this.password);
  @override
  List<Object?> get props => [password];
}
class ConfirmPasswordChangeSignupEvent extends AuthSignupEvent {
  final String? password;
  const ConfirmPasswordChangeSignupEvent(this.password);
  @override
  List<Object?> get props => [password];
}

class AuthSignupButtonEvent extends AuthSignupEvent {
  const AuthSignupButtonEvent();
  @override
  List<Object?> get props => [];
}
