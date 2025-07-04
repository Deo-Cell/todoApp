import 'package:get/get.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/auth/domain/usecases/login.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:todoapp2_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:todoapp2_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:todoapp2_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todoapp2_flutter/features/auth/presentation/controllers/login_controller.dart';


class LoginBinding extends MBindingsBuilder {
  final Client client;
  final SessionManager sessionManager;

  LoginBinding({required this.client, required this.sessionManager})
      : super(() => [
            Bind.lazyPut<AuthDataSource>(
                () => AuthDataSourceImpl(client: client, sessionManager: sessionManager)),
            Bind.lazyPut<AuthRepository>(
                () => AuthRepositoryImpl(authDataSource: Get.find())),
            Bind.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find())),
            Bind.lazyPut<LoginController>(
                () => LoginController(loginUseCase: Get.find())),
          ]);
}