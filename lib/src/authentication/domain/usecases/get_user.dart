

import 'package:tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:tdd_clean_architecture/core/utils/typedef.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class GetUser extends UsecaseWithoutParams<List<User>> {

  const GetUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUser();

}