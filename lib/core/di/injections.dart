import 'package:flutter_posteary/features/login/di/login_injection.dart';
import 'package:flutter_posteary/shared/features/posts/di/posts_injection.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

/// Initializes the dependency injection (DI) system by setting up
/// the necessary injections for the application's features.
/// 
/// This function asynchronously initializes the DI configurations
/// for the login and posts features by invoking their respective
/// initialization functions.
Future<void> initDI() async {
  // Features
  await initLoginInjections();
  await initPostsInjections();
}
