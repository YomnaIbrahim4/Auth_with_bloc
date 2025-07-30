import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/auth_repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;

  SignUpBloc(this.authRepo) : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        await authRepo.signUp(email: event.email, password: event.password);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}
