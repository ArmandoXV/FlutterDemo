import 'package:version_0/Bloc/LoginSubmissionStatus.dart';

class LoginState {
  final String username;
  bool get isValidUserName => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 8;
  final LoginFormSubmissionStatus loginstatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.loginstatus = const InitialLoginFormStatus(),
  });

  LoginState copyWith({
    String username,
    String password,
    LoginFormSubmissionStatus loginStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginstatus: loginstatus ?? this.loginstatus,
    );
  }
}
