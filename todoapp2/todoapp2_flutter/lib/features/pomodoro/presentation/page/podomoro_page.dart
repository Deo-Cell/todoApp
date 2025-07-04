import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/pomodoro_controller.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';

class PomodoroPage extends GetView<PomodoroController> {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
