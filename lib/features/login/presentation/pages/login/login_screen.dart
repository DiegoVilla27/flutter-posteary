import 'package:flutter/material.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/widgets/login_form.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/widgets/login_waves.dart';

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
