import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';
import 'package:todoapp2_flutter/features/auth/presentation/controllers/confirmation_controller.dart';

class ConfirmationPage extends GetView<ConfirmationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      appBar: AppBar(
          backgroundColor: kcPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const TextComponent(
            "Enter Verification Code",
            textcolor: Colors.white,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter the 8-letter verification code sent to your email:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextFormField(
              cursorColor: kcInputFillColors,
              controller: controller.codeController,
              //maxLength: 8, // Limite à 8 caractères
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, letterSpacing: 8, color: Colors.white),
              decoration: InputDecoration(
                hintText: "________", // Aide visuelle pour 8 lettres
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 20,
                  letterSpacing: 8,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kcInputFillColors),
                  borderRadius: BorderRadius.circular(10),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kcInputFillColors),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kcInputFillColors),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                if (value.length == 8) {
                  // Action automatique (facultative) après 8 lettres
                  FocusScope.of(context).unfocus();
                }
              },
            ),
            const SizedBox(height: 30),
            Obx(
              () => simpleButtonLoading("Verify email", kcBlueColor, context, () {
                if (controller.codeController.text.length == 8) {
                  // Vérifiez ou traitez le code
                  print("Entered Code: ${controller.codeController.text}");
                  controller.verifyCode(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please enter a valid 8-letter code")),
                  );
                }
              }, controller.isLoading.value),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't receive the email? ",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    controller.resendCode(context);
                  },
                  child: const Text(
                    "click to resend",
                    style: TextStyle(
                      fontSize: 14,
                      color: kcBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
