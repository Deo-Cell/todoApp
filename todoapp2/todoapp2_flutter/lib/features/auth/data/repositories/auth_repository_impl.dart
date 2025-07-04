import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/entities/user.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';
import 'package:todoapp2_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  const AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final result = await authDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authDataSource.logout();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmailPassword(
      {required String email, required String password, required String username}) async {
    try {
      final result = await authDataSource.registerWithEmailPassword(
          email: email, password: password, username: username);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> codeVerification(
      {required String email, required String code}) async {
    try {
      final result =
          await authDataSource.codeVerification(code: code, email: email);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, User> currentUser() {
    final user = authDataSource.currentUser();
    if (user == null) {
      return left(const Failure("User not logged in"));
    }
    return right(user);
  }
}
