import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';
import 'package:flutter_posteary/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<String> call(LoginEntity user) {
    return repository.login(user);
  }
}
