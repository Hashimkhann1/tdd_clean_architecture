

import 'package:tdd_clean_architecture/core/utils/typedef.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {

  const AuthenticationRepository();


  ResultVoid createUser({
    required createdAt,
    required name,
    required avatar
  });


  ResultFuture<List<User>> getUser();

}