

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/failure.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

/// what does the class depends on
/// How can we create a fake version of the dependancy
/// how we controle waht our dependency do





void main() {

  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  
  const params = CreateUserParams.empty();

  test(
      "Should call the [AuthRepo.createUser]",
          () async {

            /// Arrange

            when(() => repository.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'))).thenAnswer((_) async => Right(null));

            /// Act

            final result = await usecase(params);

            /// Assert
            expect(result, equals(const Right<dynamic , void>(null)));
            
            verify(() => repository.createUser(createdAt: params.createdAt, name: params.name, avatar: params.avatar)).called(1);
            
            verifyNoMoreInteractions(repository);

          }
  );
  
}

