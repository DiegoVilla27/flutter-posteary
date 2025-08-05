import 'package:dio/dio.dart';
import 'package:flutter_posteary/core/environments/environments.dart';
import 'package:flutter_posteary/core/errors/errors_handler.dart';
import 'package:flutter_posteary/features/login/data/models/login_model.dart';

/// An abstract class that defines the contract for a login data source.
///
/// This class provides a method to perform user login operations
/// by accepting a [LoginModel] and returning a [Future] that resolves
/// to a [String], typically representing a token or session identifier.
///
/// Implementations of this class should handle the actual login
/// process, including network requests and error handling.
abstract class LoginApiDataSource {
  Future<String> login(LoginModel user);
}

/// Implementation of [LoginApiDataSource] that handles user login operations.
///
/// This class uses the Dio package to perform network requests to the
/// authentication endpoint. It attempts to log in a user by sending a
/// POST request with the user's credentials in JSON format. Upon success,
/// it returns an access token as a [String]. If an error occurs during
/// the request, it catches the exception, processes it using the
/// [ExceptionHandler], and returns a [Future.error].
class LoginApiDataSourceImpl implements LoginApiDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: Environments.apiUrlUsers));

  @override
  Future<String> login(LoginModel user) async {
    try {
      final res = await dio.post(
        '/auth/login',
        data: user.toJson(),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return res.data['access_token'];
    } catch (e, st) {
      final appException = ExceptionHandler.handle(e, st);
      return Future.error(appException);
    }
  }
}
