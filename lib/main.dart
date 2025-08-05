import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/core/router/router_config.dart';
import 'package:flutter_posteary/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_posteary/core/storage/token_storage.dart';
import 'package:flutter_posteary/core/theme/theme.dart';
import 'package:flutter_posteary/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Ensures that Flutter is fully initialized before running any code that interacts with the framework.
  WidgetsFlutterBinding.ensureInitialized();
  // Init Dotenv
  await dotenv.load(fileName: ".env");
  // Load token if exists
  final token = await getToken();
  // Init DI
  await initDI();
  // Init Riverpod
  runApp(
    ProviderScope(
      overrides: [authProvider.overrideWith((ref) => token)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Posteary App',
      routerConfig: router,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeCustom().get(),
    );
  }
}
