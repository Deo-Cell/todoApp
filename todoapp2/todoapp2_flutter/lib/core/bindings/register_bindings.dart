import 'package:get/get.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/auth/domain/usecases/register.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todoapp2_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:todoapp2_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todoapp2_flutter/features/auth/presentation/controllers/register_controller.dart';

class RegisterBinding extends MBindingsBuilder {
  RegisterBinding({required Client client, required SessionManager sessionManager})
      : super(() => [
          Bind.lazyPut<AuthDataSource>(
              () => AuthDataSourceImpl(client: client, sessionManager: sessionManager)),
          Bind.lazyPut<AuthRepository>(
              () => AuthRepositoryImpl(authDataSource: Get.find())),
          Bind.lazyPut<RegisterUseCase>(() => RegisterUseCase(authRepository: Get.find())),
          Bind.lazyPut<RegisterController>(
              () => RegisterController(registerUseCase: Get.find())),
        ]);
}