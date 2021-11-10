abstract class LoginFormSubmitionStatus {
  const LoginFormSubmitionStatus();
}

class InitialLoginFormStatus extends LoginFormSubmitionStatus {
  const InitialLoginFormStatus();
}

class LoginFormSubmitting extends LoginFormSubmitionStatus {}

class LoginFormSubmitionSuccess extends LoginFormSubmitionStatus {}

class LoginFormSubmitionFaild extends LoginFormSubmitionStatus {
  final Exception exception;

  LoginFormSubmitionFaild(this.exception);
}
