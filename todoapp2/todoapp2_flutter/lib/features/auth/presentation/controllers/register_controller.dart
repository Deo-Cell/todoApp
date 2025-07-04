import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_snackbar.dart';
import 'package:todoapp2_flutter/core/params/register_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/usecases/register.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  final nameController = TextEditingController(); // 'C' majuscule
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterController({required this.registerUseCase});

  RxBool isLoading = false.obs;

  Future<void> registerUser(BuildContext context) async {
    isLoading.value = true;
    final result = await registerUseCase(RegisterParams(
      email: emailController.text,
      password: passwordController.text,
      username: nameController.text,
    ));
    isLoading.value = false;

    result.fold(
      (failure) {
        Platform.isAndroid
            ? alertAndroid(context, failure.message)
            : alertIos(context, failure.message);
      },
      (success) {
        Get.offAndToNamed('/verify', arguments: {'email': emailController.text, 'password': passwordController.text });
        print("Inscription réussie !");
      },
    );
  }
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
