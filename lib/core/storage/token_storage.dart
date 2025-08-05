import 'package:shared_preferences/shared_preferences.dart';

/// Saves the provided authentication token to persistent storage.
/// 
/// This function uses the `SharedPreferences` package to store the token
/// under the key 'auth_token', allowing it to be retrieved later for
/// authentication purposes.
/// 
/// [token] The authentication token to be saved.
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

/// Retrieves the authentication token from persistent storage.
/// 
/// This function accesses the `SharedPreferences` to fetch the token
/// stored under the key 'auth_token'. It returns the token as a string
/// if it exists, or null if not found.
/// 
/// Returns a `Future` that completes with the authentication token or null.
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}