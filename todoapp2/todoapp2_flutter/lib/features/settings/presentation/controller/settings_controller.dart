import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  final isDarkMode = false.obs;
  final Map<IconData, String> settings = {
  Icons.list: "Edit categories",
  Icons.delete: "Reset stats",
  Icons.check_box: "Verify details",
  Icons.signal_cellular_alt: "Blog",
  Icons.notifications_active: "Notifications",
  Icons.star: "Rate us",
  Icons.exit_to_app: "Sign out",
};
  void toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}
