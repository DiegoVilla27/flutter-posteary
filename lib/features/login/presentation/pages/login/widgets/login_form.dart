import 'package:flutter/material.dart';
import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/core/storage/token_storage.dart';
import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';
import 'package:flutter_posteary/features/login/domain/use_cases/login_usecase.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/validations/login_form_validations.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/widgets/login_textfield_form.dart';
import 'package:flutter_posteary/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_posteary/shared/widgets/snackbar/snackbar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A stateful widget that represents the login form in the application.
/// 
/// This widget utilizes Riverpod for state management and is responsible
/// for creating the state of the login form, which handles user input
/// and validation.
class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _formValid = false;

  /// A stateful widget that represents a login form with email and password fields.
  ///
  /// The form validates user input and attempts to authenticate the user when submitted.
  /// It uses controllers to manage the input fields and updates the form's validity status
  /// based on validation results. Upon successful login, it saves the authentication token
  /// and displays a success message. If login fails, it shows an error message.
  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() => _formValid = isValid);
  }

  /// A stateful widget that represents a login form with email and password fields.
  ///
  /// The form validates user input and attempts to authenticate the user when submitted.
  /// It uses controllers to manage the input fields and updates the form's validity status
  /// based on validation results. Upon successful login, it saves the authentication token
  /// and displays a success message. If login fails, it shows an error message.
  dynamic _onSave() async {
    if (_formValid) {
      LoginUseCase loginUseCase = di<LoginUseCase>();
      LoginEntity user = LoginEntity(
        email: _emailCtrl.text,
        password: _passwordCtrl.text,
      );
      try {
        final token = await loginUseCase(user);
        if (token.isNotEmpty) {
          ref.read(authProvider.notifier).state = token;
          saveToken(token);
          SnackBarCustom.open("¡Welcome!", SnackbarType.success);
        }
      } catch (_) {
        SnackBarCustom.open("Invalid credentials", SnackbarType.error);
      }
    }
  }

  /// Disposes of the controllers and releases resources.
  ///
  /// This method is called when the object is removed from the widget tree
  /// permanently. It ensures that all controllers are properly disposed of
  /// to prevent memory leaks.
  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            'Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFieldCustom(
              name: "Email",
              keyboardType: TextInputType.emailAddress,
              controller: _emailCtrl,
              validations: validationsEmail,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFieldCustom(
              name: "Password",
              obscureText: true,
              controller: _passwordCtrl,
              validations: validationsPassword,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _onSave();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
