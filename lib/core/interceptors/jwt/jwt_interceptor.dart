import 'package:dio/dio.dart';
import 'package:flutter_posteary/core/storage/token_storage.dart';

/// An interceptor that adds an Authorization header with a Bearer token
/// to outgoing requests if a valid token is available.
///
/// This class extends the Dio Interceptor and overrides the onRequest method
/// to include the token in the request headers. If the token is null or empty,
/// the request proceeds without the Authorization header.
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {}

    return handler.next(options);
  }
}
