import 'package:get/get.dart';
import '../../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import '../controller/settings_controller.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    sessionManager.signedInUser?.imageUrl ?? "",
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      sessionManager.signedInUser?.userName ?? "",
                      fontsize: 20,
                      fontweight: FontWeight.w600,
                    ),
                    TextComponent(
                      sessionManager.signedInUser?.email ?? "",
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      textcolor: kcGreyColor,
                    ),
                    TextComponent(
                      "+1-1234567890",
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      textcolor: kcGreyColor,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        simpleButtonComponent("Update", context, () {}),
                        const SizedBox(width: 20),
                        TextComponent(
                          "Add new account",
                          fontsize: 12,
                          fontweight: FontWeight.w400,
                          textcolor: kcGreyColor,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
              Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0;
                      index < controller.settings.length;
                      index++)
                    _buildSettingsItem(
                      icon: controller.settings.keys.elementAt(index),
                      label: controller.settings.values.elementAt(index),
                      isLast: index == controller.settings.length - 1,
                      isSpecial: index == 6,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String label,
    required bool isLast,
    required bool isSpecial,
  }) {
    return FadeInUp(
      from: 50,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: isSpecial ? Colors.red : Color(0xFF747474),
              size: 28,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextComponent(
                      label,
                      fontsize: 14,
                      textcolor: isSpecial ? Colors.red : Color.fromARGB(255, 108, 107, 107),
                    ),
                  ),
                  isSpecial ? const SizedBox.shrink() : const Divider(),
                ],
              ),
            ),
          
            onTap: () {
              // Gérer l'action au clic
            },
          ),
        ],
      ),
    );
  }
}
