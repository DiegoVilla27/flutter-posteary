import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that manages the authentication state as a nullable string.
/// 
/// This `StateProvider` initializes with a `null` value, representing
/// an unauthenticated state. It can be used to store and update the
/// authentication token or user identifier.
final authProvider = StateProvider<String?>((ref) => null);