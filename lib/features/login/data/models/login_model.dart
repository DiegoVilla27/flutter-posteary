/// A model class representing login credentials.
///
/// This class holds the user's email and password, and provides
/// a method to convert these credentials into a JSON format.
class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
