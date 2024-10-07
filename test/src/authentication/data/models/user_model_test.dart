

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/core/utils/typedef.dart';
import 'package:tdd_clean_architecture/src/authentication/data/models/user_model.dart';
import 'package:tdd_clean_architecture/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  final tModel = UserModel.empty();

  test("Should be a subClass of [User] entity", () {
    /// Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;


  group("fromMap", () {
    test("should return a [UserModel with the right data", (){
      final result = UserModel.fromMap(tMap);
      
      expect(result, equals(tModel));

    });
  });

  group("fromJson", () {
    test("should return a [UserModel] with the right data", (){
      final result = UserModel.fromJson(tJson);

      expect(result, equals(tModel));

    });
  });

  
  group("toMap", () {

    test("should return a [Map] with the right data", () {

      /// Act
      final result = tModel.toMap();
      expect(result, equals(tMap));

    });

  });
  
  group("toJson", () {
    test("should return a [JSON] string with the right data", () {

      /// Act
      final result = tModel.toJson();

      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name"
      });

      /// Assert
      expect(result, tJson);

    });
  });

  group("copyWith", (){

    test("should return a [UserModel] with the different data", () {

      final result = tModel.copyWith(name: "Paul");

      expect(result.name, equals('Paul'));
      // expect(result, equals('Paul'));

    });

  });

  

}