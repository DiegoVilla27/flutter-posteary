import 'package:dio/dio.dart';
import 'package:flutter_posteary/core/environments/environments.dart';
import 'package:flutter_posteary/core/errors/errors_handler.dart';
import 'package:flutter_posteary/core/interceptors/jwt/jwt_interceptor.dart';
import 'package:flutter_posteary/shared/features/posts/data/models/post_model.dart';

/// An abstract class that defines the contract for fetching posts data
/// from an API source.
abstract class PostsApiDataSource {
  Future<List<PostModel>> getAll();
}

/// Implementation of the `PostsApiDataSource` interface for fetching
/// posts data from a remote API.
///
/// Utilizes the Dio package for HTTP requests and includes an
/// `AuthInterceptor` for handling authentication.
class PostsApiDataSourceImpl implements PostsApiDataSource {
  final String basePosts = 'posts';
  final Dio dio = Dio(BaseOptions(baseUrl: Environments.apiUrlUsers))
    ..interceptors.add(AuthInterceptor());

  /// Fetches all posts from the API and returns a list of
  /// `PostModel` instances. In case of an error, it returns a Future
  /// with an application-specific exception.
  @override
  Future<List<PostModel>> getAll() async {
    try {
      final res = await dio.get(
        '/$basePosts',
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return (res.data['posts'] as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e, st) {
      final appException = ExceptionHandler.handle(e, st);
      return Future.error(appException);
    }
  }
}
