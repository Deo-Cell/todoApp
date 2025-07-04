import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/entities/user.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/core/params/login_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements Usecase<User, LoginParams> {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

