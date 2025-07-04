import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_snackbar.dart';
import 'package:todoapp2_flutter/core/params/verification_params.dart';
import 'package:todoapp2_flutter/features/auth/domain/usecases/verification.dart';

class ConfirmationController extends GetxController {
  final VerificationUseCase verificationUseCase;

  ConfirmationController({required this.verificationUseCase});
  final codeController = TextEditingController();
  RxBool isLoading = false.obs;
  final userData = Get.arguments;

  Future<void> verifyCode(BuildContext context) async {
  print(userData);
    isLoading.value = true;
    final result = await verificationUseCase(VerificationParams(
        email: userData['email'],
        code: codeController.text,
        password: userData['password']));
    isLoading.value = true;

    result.fold((failure) {
      Platform.isAndroid
          ? alertAndroid(context, failure.message)
          : alertIos(context, failure.message);
      isLoading.value = false;
    }, (sucess) {
      Get.offAndToNamed('/home/tasks');
    });
  }

  Future<void> resendCode(BuildContext context) async {
    final result = await verificationUseCase(VerificationParams(
        email: userData['email'],
        code: codeController.text,
        password: userData['password']));

    result.fold((failure) {
      Platform.isAndroid
          ? alertAndroid(context, failure.message)
          : alertIos(context, failure.message);
    }, (sucess) {
      Platform.isAndroid
          ? alertAndroid(context,
              "The code has been successfully send to your email address")
          : alertIos(context,
              "The code has been successfully sent to your email address");
    });
  }
}
