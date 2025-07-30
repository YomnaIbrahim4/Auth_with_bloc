import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<InitLoginScreenEvent>((event, emit) {
      emit(LoginInitial());
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await authRepo.login(email: event.email, password: event.password);
        emit(LoginSuccess(event.email));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LoginReset>((event, emit) {
      emit(LoginInitial());
    });
  }
}
