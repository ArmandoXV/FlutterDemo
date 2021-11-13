import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_0/Bloc/AuthRepository.dart';
import 'package:version_0/Bloc/LoginEvent.dart';
import 'package:version_0/Bloc/LoginSubmissionStatus.dart';

import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginUserChanged) {
      yield state.copyWith(username: event.userName);
    }

    // Password updated
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    // Form submitted
    else if (event is LoginSubmitted) {
      yield state.copyWith(loginStatus: LoginFormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(loginStatus: LoginFormSubmissionSuccess());
      } catch (e) {
        yield state.copyWith(loginStatus: LoginFormSubmissionFailed(e));
      }
    }
  }
}
