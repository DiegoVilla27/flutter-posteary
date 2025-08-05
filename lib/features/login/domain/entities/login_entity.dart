/// A class representing a login entity with email and password.
///
/// This class is used to encapsulate the login credentials required
/// for authentication processes.
///
/// Attributes:
///   email: A string representing the user's email address.
///   password: A string representing the user's password.
class LoginEntity {
  String email;
  String password;

  LoginEntity({required this.email, required this.password});
}
