abstract class Failure {
  final String? message;

  Failure({this.message});
}

class ConnectionFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class NotFoundFailure extends Failure {}

class WrongFormatFailure extends Failure {}

class TooManyRequestsFailure extends Failure {}

class UnknownFailure extends Failure {}
