abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

class InvalidCredentialsExceptions extends AppException {
  const InvalidCredentialsExceptions() : super('Invalid email or password.');
}

class EmailAlreadyInUseException extends AppException {
  const EmailAlreadyInUseException()
    : super('An account with this email already exists.');
}

class NetworkException extends AppException {
  const NetworkException() : super('Please check your internet connection.');
}

class ServerException extends AppException {
  const ServerException() : super('Server error. Please try again later.');
}

class UnknownException extends AppException {
  const UnknownException() : super('Something went wrong.');
}
