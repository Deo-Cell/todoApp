import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/entities/user.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/params/no_params.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';


class CurrentUserUseCase implements Usecase<User, NoParams> {
  final AuthRepository authRepository;
 const CurrentUserUseCase(this.authRepository);

  @override
 Future<Either<Failure, User>> call(NoParams params) async {
    return authRepository.currentUser();
  }
}
