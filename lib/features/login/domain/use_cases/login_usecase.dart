import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';
import 'package:flutter_posteary/features/login/domain/repositories/login_repository.dart';

/// A use case class for handling user login operations.
///
/// This class interacts with the [LoginRepository] to perform login actions
/// using the provided [LoginEntity] user data. It returns a [Future] that
/// resolves to a [String] indicating the result of the login attempt.
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<String> call(LoginEntity user) {
    return repository.login(user);
  }
}
