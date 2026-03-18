// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutterwebhosting/src/core/api/client/endpoints.dart';
// import 'package:flutterwebhosting/src/core/service/injectable/injectable_service.dart';
// import 'package:talker_dio_logger/talker_dio_logger.dart';
// import 'package:talker_flutter/talker_flutter.dart';

// class DioInterceptor {
//   final Dio api;

//   Dio get getDio => api;

//   DioInterceptor(this.api) {
//     var talker = getIt<Talker>();

//     api.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           options.connectTimeout = const Duration(seconds: 30);
//           options.receiveTimeout = const Duration(seconds: 30);

//           final String userAgent = kIsWeb ? 'Web' : 'Mobile';

//           options.headers['Accept'] = 'application/json';
//           options.headers['User-Agent'] = userAgent;
//           options.baseUrl = EndPoints.baseUrl;

//           return handler.next(options);
//         },
//         onError: (DioException error, handler) async {
//           // Simple error handling
//           log('API Error: ${error.message}');
//           return handler.next(error);
//         },
//       ),
//     );

//     api.interceptors.add(
//       TalkerDioLogger(
//         talker: getIt<Talker>(),
//         settings: TalkerDioLoggerSettings(
//           printRequestHeaders: true,
//           printResponseHeaders: false,
//           printResponseMessage: true,
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:brand_admin/src/core/router/router.dart';
import 'package:brand_admin/src/core/service/injectable/injectable_service.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioInterceptor {
  final Dio api;

  Dio get getDio => api;
  String? accessToken;
  Future<bool>? _refreshingFuture;

  final FlutterSecureStorageWeb _storageService = FlutterSecureStorageWeb();

  token() async {
    return await _storageService.getToken();
  }

  DioInterceptor(this.api) {
    _initializeToken();
    // ignore: unused_local_variable
    var talker = getIt<Talker>();

    // api.interceptors.add(ConnectionRetryInterceptor(api));

    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.connectTimeout = const Duration(seconds: 30);
          options.receiveTimeout = const Duration(seconds: 30);
          options.headers['Accept'] = 'application/json';
          options.headers['User-Agent'] = kIsWeb ? 'Web' : 'Mobile';
          options.baseUrl = EndPoints.baseUrl;

          accessToken = await token();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
            options.headers['Accept'] = 'application/json';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          final talker = getIt<Talker>();
          final data = error.response?.data;
          talker.log(
            'Dio error data type: ${data.runtimeType}, value: ${data.toString()}',
            logLevel: LogLevel.error,
          );
          bool isMissingAuth = false;
          try {
            isMissingAuth = _isMissingAuthHeader(data);
          } catch (e, stack) {
            talker.log(
              'Exception in _isMissingAuthHeader: ${e.toString()} \nStack: ${stack.toString()}',
              logLevel: LogLevel.error,
            );
          }
          if (_isUnauthorized(error.response?.statusCode) &&
              await _tryRefreshAndRetry(error, handler)) {
            return;
          }
          if (_isAuthError(error.response?.statusCode) || isMissingAuth) {
            return _handleAuthError(error, handler);
          }
          return handler.next(error);
        },
      ),
    );

    api.interceptors.add(
      TalkerDioLogger(
        talker: getIt<Talker>(),
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
        ),
      ),
    );

    // api.interceptors.addAll(
    //   [
    //     if (kDebugMode)
    //       PrettyDioLogger(
    //         requestBody: true,
    //         responseBody: true,
    //         requestHeader: false,
    //       ),
    //   ],
    // );
  }

  Future<void> _initializeToken() async {
    accessToken = await token();
    final talker = getIt<Talker>();
    talker.log(
      "Token loaded: ${_maskedToken(accessToken)}",
      logLevel: LogLevel.info,
    );
  }

  bool _isUnauthorized(int? statusCode) => statusCode == 401;
  bool _isAuthError(int? statusCode) => statusCode == 401 || statusCode == 403;

  bool _isMissingAuthHeader(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['result'] == 'missing auth header' ||
          data['message'] == 'missing auth header';
    }
    if (data is String) {
      return data.contains('missing auth header');
    }
    return false;
  }

  // Handle authentication error
  Future<void> _handleAuthError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    log('Authentication error occurred');
    await _storageService.deleteToken();
    accessToken = null;
    BuildContext? context = rootNavigatorKey.currentContext;
    if (context != null) {
      while (context.canPop()) {
        context.pop();
      }
      context.push(RoutePaths.loginPasswordPage);
    }
    return handler.next(error);
  }

  Future<bool> _tryRefreshAndRetry(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final path = error.requestOptions.path;
    if (path.contains(EndPoints.login) ||
        path.contains(EndPoints.refreshToken)) {
      return false;
    }

    final refreshed = await _refreshToken();
    if (!refreshed) return false;

    final retryOptions = Options(
      method: error.requestOptions.method,
      headers: Map<String, dynamic>.from(error.requestOptions.headers)
        ..['Authorization'] = 'Bearer $accessToken',
      responseType: error.requestOptions.responseType,
      contentType: error.requestOptions.contentType,
      followRedirects: error.requestOptions.followRedirects,
      receiveDataWhenStatusError:
          error.requestOptions.receiveDataWhenStatusError,
      validateStatus: error.requestOptions.validateStatus,
    );

    final response = await api.request<dynamic>(
      error.requestOptions.path,
      data: error.requestOptions.data,
      queryParameters: error.requestOptions.queryParameters,
      options: retryOptions,
    );
    handler.resolve(response);
    return true;
  }

  Future<bool> _refreshToken() async {
    if (_refreshingFuture != null) {
      return _refreshingFuture!;
    }

    _refreshingFuture = _doRefreshToken();
    final result = await _refreshingFuture!;
    _refreshingFuture = null;
    return result;
  }

  Future<bool> _doRefreshToken() async {
    final talker = getIt<Talker>();
    final refresh = await _storageService.getRefresh();
    if (refresh == null || refresh.isEmpty) {
      talker.log(
        'Refresh token missing in storage',
        logLevel: LogLevel.warning,
      );
      return false;
    }

    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: <String, dynamic>{'Accept': 'application/json'},
        ),
      );

      final endpointCandidates = <String>{
        EndPoints.refreshToken,
        '${EndPoints.refreshToken}/',
        'api/auth/refresh',
        'api/auth/refresh/',
      }.toList();

      final payloadCandidates = <Map<String, dynamic>>[
        <String, dynamic>{'refresh': refresh},
        <String, dynamic>{'refresh_token': refresh},
        <String, dynamic>{'token': refresh},
      ];

      for (final endpoint in endpointCandidates) {
        for (final payload in payloadCandidates) {
          try {
            final response = await refreshDio.post<dynamic>(
              endpoint,
              data: payload,
            );
            final rawData = response.data;
            final data = rawData is Map<String, dynamic>
                ? rawData
                : <String, dynamic>{};
            final tokens = data['tokens'] is Map<String, dynamic>
                ? data['tokens'] as Map<String, dynamic>
                : data;

            final newAccess =
                (tokens['access'] ??
                        tokens['access_token'] ??
                        data['access'] ??
                        data['access_token'] ??
                        '')
                    .toString();
            final newRefresh =
                (tokens['refresh'] ??
                        tokens['refresh_token'] ??
                        data['refresh'] ??
                        data['refresh_token'] ??
                        '')
                    .toString();

            if (newAccess.isEmpty) {
              continue;
            }

            await _storageService.setToken(newAccess);
            if (newRefresh.isNotEmpty) {
              await _storageService.setRefresh(newRefresh);
            }
            accessToken = newAccess;
            talker.log(
              'Token refresh succeeded via $endpoint payload:${payload.keys.join(",")}',
              logLevel: LogLevel.info,
            );
            return true;
          } catch (_) {
            // try next endpoint/payload candidate
          }
        }
      }

      talker.log(
        'Token refresh failed for all endpoint/payload candidates',
        logLevel: LogLevel.error,
      );
      return false;
    } catch (_) {
      talker.log('Token refresh failed unexpectedly', logLevel: LogLevel.error);
      return false;
    }
  }

  String _maskedToken(String? value) {
    if (value == null || value.isEmpty) return '(empty)';
    if (value.length <= 16) return value;
    return '${value.substring(0, 8)}...${value.substring(value.length - 8)}';
  }

  // ignore: unused_element
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
