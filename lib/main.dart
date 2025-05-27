import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_posteary/core/router/router_config.dart';
import 'package:flutter_posteary/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init Dotenv
  await dotenv.load(fileName: ".env");
  // Init Riverpod
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Posteary App',
      routerConfig: AppRouter.router,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
