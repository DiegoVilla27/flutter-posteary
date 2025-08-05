import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';

/// An abstract class that defines the contract for a login repository.
/// 
/// This repository handles user login operations by providing a method
/// to authenticate a user based on the provided [LoginEntity].
/// 
/// Methods:
/// - [login]: Authenticates a user and returns a token as a [Future<String>].
abstract class LoginRepository {
  Future<String> login(LoginEntity user);
}
