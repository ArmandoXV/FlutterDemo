abstract class LoginFormSubmissionStatus {
  const LoginFormSubmissionStatus();
}

class InitialLoginFormStatus extends LoginFormSubmissionStatus {
  const InitialLoginFormStatus();
}

class LoginFormSubmitting extends LoginFormSubmissionStatus {}

class LoginFormSubmissionSuccess extends LoginFormSubmissionStatus {}

class LoginFormSubmissionFailed extends LoginFormSubmissionStatus {
  final Exception exception;

  LoginFormSubmissionFailed(this.exception);
}
