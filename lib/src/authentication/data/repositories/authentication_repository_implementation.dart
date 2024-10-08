


import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/exception.dart';
import 'package:tdd_clean_architecture/core/errors/failure.dart';
import 'package:tdd_clean_architecture/core/utils/typedef.dart';
import 'package:tdd_clean_architecture/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {

  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required createdAt,
    required name,
    required avatar}) async {

    // Test Driven Development.
    // Call the remote data source.
    // check if the method returens prper data.
    // check if the remote data source thrown an exceptions we return failure and
    // if it dosent thrown an exception we return the actual expected data.

    try{
      await _remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    }on APIException catch(e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }



}