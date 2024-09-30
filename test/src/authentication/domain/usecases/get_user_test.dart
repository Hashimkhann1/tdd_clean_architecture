


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/usecases/get_user.dart';

import 'authentication_repository.mock.dart';

void main() {

  late AuthenticationRepository repository;
  late GetUser usecase;
  
  setUp(() async {

    repository = MockAuthRepo();
    usecase = GetUser(repository);

  });

  const tResponce = [User.empty()];
  
  test("Should call the [AuthRepo.getUser] and retun [List<User>]", () async {

    /// Arrange
    when(() => repository.getUser()).thenAnswer((_) async => Right(tResponce));

    /// Act
    final result = await usecase();

    expect(result, equals(const Right<dynamic , List<User>>(tResponce)));

    verify(() => repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);

  });

}