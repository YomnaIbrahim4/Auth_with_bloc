part of 'signup_bloc.dart';

abstract class SignUpEvent {}

class SignUpSubmittedEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpSubmittedEvent({required this.email, required this.password});
}
