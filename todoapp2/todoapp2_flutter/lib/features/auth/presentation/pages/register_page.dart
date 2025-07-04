import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';
import 'package:todoapp2_flutter/core/common/input_component.dart';
import 'package:todoapp2_flutter/features/auth/presentation/controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: 500,
              child: Image.asset(
                "assets/images/todolist.jpg",
                fit: BoxFit.cover,
              )),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.15,
              left: MediaQuery.sizeOf(context).height * 0.18,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20)),
                          color: Color(0xFF10A8FE),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      Container(
                        height: 55,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20)),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.27,
                left: MediaQuery.sizeOf(context).height * 0.169),
            child: const TextComponent(
              "To-Do",
              fontsize: 43,
              textcolor: Colors.white,
              fontweight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.335,
                left: MediaQuery.sizeOf(context).height * 0.15),
            child: Transform(
              transform: Matrix4.identity()
                ..scale(
                  1.6,
                ),
              child: const TextComponent(
                "Let's get things done ",
                fontsize: 10,
                textcolor: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: kcPrimaryColor,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const TextComponent(
                    "SignUp",
                    fontsize: 20,
                    textcolor: Colors.white,
                    fontweight: FontWeight.w700,
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Row(
                      children: [
                        TextComponent(
                          "Name",
                          fontsize: 16,
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 40,
                      controller: controller.nameController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Row(
                      children: [
                        TextComponent(
                          "Email",
                          fontsize: 16,
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 40,
                      controller: controller.emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Row(
                      children: [
                        TextComponent(
                          "Password",
                          fontsize: 16,
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 40,
                      controller: controller.passwordController,
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(
                      () => simpleButtonLoading(
                          "Get Started", kcBlueColor, context, () {
                        controller.registerUser(context);
                      }, controller.isLoading.value),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?  ",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAndToNamed('/login');
                        },
                        child: const Text(
                          "Login",
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
          )
        ],
      ),
    );
  }
}
