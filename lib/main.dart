import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/core/router/router_config.dart';
import 'package:flutter_posteary/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_posteary/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init Dotenv
  await dotenv.load(fileName: ".env");
  // Init DI
  await initDI();
  // Init Riverpod
  runApp(ProviderScope(child: const MyApp()));
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
