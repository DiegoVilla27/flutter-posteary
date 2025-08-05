import 'package:flutter_posteary/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_posteary/features/login/data/models/login_model.dart';
import 'package:flutter_posteary/features/login/domain/entities/login_entity.dart';
import 'package:flutter_posteary/features/login/domain/repositories/login_repository.dart';

/// Implementation of the LoginRepository interface that handles user login
/// operations by interacting with the LoginApiDataSourceImpl.
/// 
/// This class converts a LoginEntity into a LoginModel and delegates the
/// login process to the data source.
/// 
/// - Requires a LoginApiDataSourceImpl instance for data operations.
class LoginRepositoryImpl implements LoginRepository {
  final LoginApiDataSourceImpl loginDataSourceImpl;

  LoginRepositoryImpl({required this.loginDataSourceImpl});

  @override
  Future<String> login(LoginEntity user) {
    LoginModel userModel = LoginModel(
      email: user.email,
      password: user.password,
    );
    return loginDataSourceImpl.login(userModel);
  }  
}
