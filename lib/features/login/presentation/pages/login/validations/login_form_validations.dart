/// Validates an email input by checking if it is non-null, non-empty, and
/// matches a standard email format.
///
/// Returns a validation error message if the input is invalid, otherwise
/// returns null.
///
/// - Parameters:
///   - value: The input value to validate.
///
/// - Returns: A string error message if validation fails, or null if the
///   input is valid.
dynamic validationsEmail(dynamic value) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }
  if (!emailRegex.hasMatch(value)) {
    return 'Invalid email';
  }
  return null;
}

/// Validates a password input by ensuring it is non-null, non-empty, and
/// within the specified character length range of 8 to 20.
///
/// Returns a validation error message if the input is invalid, otherwise
/// returns null.
///
/// - Parameters:
///   - value: The input value to validate.
///
/// - Returns: A string error message if validation fails, or null if the
///   input is valid.
dynamic validationsPassword(dynamic value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8 || value.length > 20) {
    return 'Must be between 8 and 20 characters';
  }
  return null;
}
