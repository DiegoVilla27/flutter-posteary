import 'package:flutter_posteary/features/login/di/login_injection.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // Features
  await initLoginInjections();
}
