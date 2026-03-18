// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:flutterwebhosting/src/core/service/storage/storage_service_impl.dart';
// import 'package:flutterwebhosting/src/core/utils/loggers/logger.dart';


// class TokenInterceptor extends Interceptor {
//   final Dio dio;
//   final StorageServiceImpl storage = StorageServiceImpl();

//   TokenInterceptor({required this.dio});

//   @override
//   Future<void> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final accessToken = storage.getAccessToken();
//     Log.i('Access token in onRequest: $accessToken');
//     if (accessToken != null) {
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//     handler.next(options);
//   }

//   // @override
//   // Future<void> onError(
//   //     DioException err, ErrorInterceptorHandler handler) async {
//   //   if ((err.response?.statusCode == 401 || err.response?.statusCode == 403) &&
//   //       storage.getAccessToken() != null) {
//   //     final requestOptions = err.requestOptions;

//   //     if (!_isRefreshing) {
//   //       _isRefreshing = true;
//   //       try {
//   //         await _refreshToken();
//   //         _isRefreshing = false;
//   //         while (_refreshQueue.isNotEmpty) {
//   //           await _refreshQueue.removeFirst()();
//   //         }
//   //         final response = await _retry(requestOptions);
//   //         return handler.resolve(response);
//   //       } catch (e) {
//   //         _isRefreshing = false;
//   //         await _handleFailedRefresh(handler, requestOptions);
//   //         return;
//   //       }
//   //     } else {
//   //       final responseCompleter = Completer<Response>();
//   //       _refreshQueue.add(() async {
//   //         try {
//   //           final response = await _retry(requestOptions);
//   //           responseCompleter.complete(response);
//   //         } catch (e) {
//   //           responseCompleter.completeError(e);
//   //         }
//   //       });
//   //       return handler.resolve(await responseCompleter.future);
//   //     }
//   //   }
//   //   handler.next(err);
//   // }

//   Future<void> _refreshToken() async {
//     final refreshToken = storage.getRefreshToken();
//     Log.i('BEFORE Using refresh token: $refreshToken');
//     if (refreshToken != null) {
//       try {
//         final response = await dio.post(
//           'http://195.49.215.169/back/auth/refresh',
//           options: Options(headers: {'Content-Type': 'application/json'}),
//           data: {'refreshToken': refreshToken},
//         );
//         Log.i('AFTER Using refresh token: ${response.data['refreshToken']}');
//         await storage.setAccessToken(response.data['accessToken']);
//         await storage.setRefreshToken(response.data['refreshToken']);
//       } catch (e) {
//         Log.e('Token refresh error: $e');
//         await storage.deleteAccessToken();
//         await storage.deleteRefreshToken();
//         rethrow;
//       }
//     } else {
//       throw Exception('No refresh token available');
//     }
//   }

//   // Future<void> _handleFailedRefresh(
//   //     ErrorInterceptorHandler handler, RequestOptions requestOptions) async {
//   //   await storage.deleteAccessToken();
//   //   await storage.deleteRefreshToken();
//   //   _refreshQueue.clear();
//   //   final context = rootNavigatorKey.currentContext;
//   //   if (context != null && context.mounted) {
//   //     context.pushReplacementNamed(RouteNames.auth);
//   //   }
//   //   handler.next(DioException(
//   //     requestOptions: requestOptions,
//   //     error: 'Token refresh failed',
//   //   ));
//   // }

//   Future<Response> _retry(RequestOptions requestOptions) {
//     return dio.request(
//       requestOptions.path,
//       options: Options(
//         method: requestOptions.method,
//         headers: requestOptions.headers,
//       ),
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//     );
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   }
// }
