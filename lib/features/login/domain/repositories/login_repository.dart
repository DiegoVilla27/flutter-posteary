import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<String> login(LoginEntity user);
}
