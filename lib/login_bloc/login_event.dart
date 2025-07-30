part of 'login_bloc.dart';

abstract class LoginEvent {}

class InitLoginScreenEvent extends LoginEvent {}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent({required this.email, required this.password});
}

class LoginReset extends LoginEvent {}
