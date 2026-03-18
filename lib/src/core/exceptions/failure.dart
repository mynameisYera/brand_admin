import 'package:dio/dio.dart';

import 'network_exceptions.dart';

abstract class Failure {
  NetworkExceptions get exception;
}

class ErrorMessageException implements Failure {
  Response? response;
  ErrorMessageException(this.response);

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class ServerFailure extends Failure {
  Response? response;
  ServerFailure(String? statusMessage, {this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
      );
}

class CacheFailure extends Failure {
  Response? response;
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
      );
}

class DioFailure extends Failure {
  Response? response;

  DioFailure({this.response});

  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: response?.statusCode,
        response: response,
        message: response?.data['message'] as String?,
      );
}

class DioConnectionError extends DioException {
  DioConnectionError({
    required super.requestOptions,
    super.response,
    super.type,
    dynamic super.error,
  });
}

class NoConnectionFailure extends Failure {
  @override
  NetworkExceptions get exception => NetworkExceptions(
        statusCode: -3,
      );
}

class ServerException implements Exception {
  String? message;
  Response? response;
  ServerException({this.message, this.response});
}
