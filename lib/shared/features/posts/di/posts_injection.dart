import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/shared/features/posts/data/datasources/posts_datasource.dart';
import 'package:flutter_posteary/shared/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:flutter_posteary/shared/features/posts/domain/repositories/posts_repository.dart';
import 'package:flutter_posteary/shared/features/posts/domain/use_cases/get_all_usecase.dart';

/// Initializes dependency injections for the posts feature.
/// 
/// This function registers the necessary data sources, repositories,
/// and use cases for the posts feature using lazy singleton pattern.
/// It ensures that the `PostsApiDataSourceImpl`, `PostsRepositoryImpl`,
/// and `PostsUseCase` are available for dependency injection.
Future<void> initPostsInjections() async {
  // Data sources
  di.registerLazySingleton<PostsApiDataSourceImpl>(
    () => PostsApiDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(postsDataSourceImpl: di()),
  );

  // UseCases
  di.registerLazySingleton<PostsUseCase>(() => PostsUseCase(repository: di()));
}
