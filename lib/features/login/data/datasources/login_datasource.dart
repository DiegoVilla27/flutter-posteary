import 'package:dio/dio.dart';
import 'package:flutter_posteary/core/environments/environments.dart';
import 'package:flutter_posteary/core/errors/errors_handler.dart';
import 'package:flutter_posteary/features/login/data/models/login_model.dart';

abstract class LoginApiDataSource {
  Future<String> login(LoginModel user);
}

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
