import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_posteary/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_posteary/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_posteary/features/login/domain/use_cases/login_usecase.dart';

/// Initializes the dependency injection for the login feature.
/// 
/// This function registers the necessary data sources, repositories, and
/// use cases for the login feature using lazy singleton pattern. It ensures
/// that the `LoginApiDataSourceImpl`, `LoginRepositoryImpl`, and `LoginUseCase`
/// are available for dependency injection throughout the application.
Future<void> initLoginInjections() async {
  // Data sources
  di.registerLazySingleton<LoginApiDataSourceImpl>(
    () => LoginApiDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginDataSourceImpl: di()),
  );

  // UseCases
  di.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: di()));
}
