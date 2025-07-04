import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, bool>> registerWithEmailPassword(
      {required String email, required String password, required String username});
  Future<Either<Failure, User>> codeVerification(
      {required String email, required String code});
  Either<Failure, User> currentUser();
}
