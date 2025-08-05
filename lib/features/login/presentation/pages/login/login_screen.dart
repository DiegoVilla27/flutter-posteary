import 'package:flutter/material.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/widgets/login_form.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/widgets/login_waves.dart';

/// A stateless widget that represents the login screen of the application.
///
/// This widget uses a `Scaffold` to provide the basic material design layout
/// structure. It contains a `Stack` with two main components:
/// - `LoginWaves`: A widget that displays animated waves as a background.
/// - `LoginForm`: A widget that contains the form fields and logic for user login.
///
/// The `PopScope` widget is used to prevent the screen from being popped
/// off the navigation stack.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            LoginWaves(),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
