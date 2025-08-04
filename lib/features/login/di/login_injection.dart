import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_posteary/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_posteary/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_posteary/features/login/domain/use_cases/login_usecase.dart';

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
