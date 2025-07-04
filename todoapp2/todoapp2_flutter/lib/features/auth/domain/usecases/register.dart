import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/core/params/register_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements Usecase<bool, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(RegisterParams params) {
    return authRepository.registerWithEmailPassword(
        email: params.email, password: params.password, username: params.username);
  }
}
