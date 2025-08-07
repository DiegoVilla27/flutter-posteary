import 'package:flutter_posteary/core/storage/token_storage.dart';
import 'package:flutter_posteary/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logs out the user by clearing the stored token and resetting the authentication state.
///
/// This function clears the authentication token from storage and, if a [WidgetRef]
/// is provided, sets the authentication state to null using the [authProvider].
///
/// [ref] is an optional parameter that, if provided, allows the function to access
/// and modify the authentication state through the [authProvider].
///
/// Returns a [Future] that completes when the logout process is finished.
Future<void> logout(WidgetRef? ref) async {
  await clearToken();
  if (ref != null) {
    ref.read(authProvider.notifier).state = null; 
  }
}
