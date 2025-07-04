import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/entities/user.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/core/params/verification_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';


class VerificationUseCase implements Usecase<User, VerificationParams> {
  final AuthRepository authRepository;

  VerificationUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(VerificationParams params) async {
   final confirmationResult = await authRepository.codeVerification(
      email: params.email,
      code: params.code,
    );

    return await confirmationResult.fold((failure) => left(failure), (r) async {
      return await authRepository.loginWithEmailPassword(
        email: params.email,
        password: params.password,
      );
    });

  }
}
