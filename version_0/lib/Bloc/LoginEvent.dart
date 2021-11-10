abstract class LoginEvent {}

class LoginUserChanged extends LoginEvent {
  final String userName;

  LoginUserChanged({this.userName});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}
