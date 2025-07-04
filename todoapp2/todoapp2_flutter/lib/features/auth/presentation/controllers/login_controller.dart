import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_snackbar.dart';
import 'package:todoapp2_flutter/core/params/login_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/usecases/login.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;

  Future<void> loginUser(BuildContext context) async {
    isLoading.value = true;
    final result = await loginUseCase(LoginParams(
        email: emailController.text, password: passwordController.text));
    isLoading.value = false;

    result.fold((failure) {
      print("failure ${failure.message.toString()}");
      Platform.isAndroid
          ? alertAndroid(context, failure.message)
          : alertIos(context, failure.message);
    }, (sucess) {
      Get.offAndToNamed('/tasks');
    });
  }
}
