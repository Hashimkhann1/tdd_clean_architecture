

import 'package:tdd_clean_architecture/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {

  Future<void> createUser({
    required createdAt,
    required name,
    required avatar});

  Future<List<UserModel>> getUsers();

}