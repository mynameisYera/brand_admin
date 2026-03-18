sealed class DomainException implements Exception {
  DomainException({
    required this.message,
    this.stackTrace,
  });
  String message;
  StackTrace? stackTrace;

  @override
  String toString() {
    String message = this.message;
    return 'Exception: $message';
  }
}

class UnknownException extends DomainException {
  UnknownException({String? message, super.stackTrace})
      : super(
          message: message ?? 'unknown Exception',
        );
}

class BadRequest extends DomainException {
  BadRequest({super.stackTrace}) : super(message: 'bad Request');
}

class UnknownError extends DomainException {
  UnknownError() : super(message: 'unknown Error');
}

class NoInternetConnectionException extends DomainException {
  NoInternetConnectionException()
      : super(message: 'no Internet Connection Exception');
}

class MapperException extends DomainException {
  MapperException() : super(message: 'mapper Exception');
}

class NetworkException extends DomainException {
  NetworkException({required super.message, super.stackTrace});
}
