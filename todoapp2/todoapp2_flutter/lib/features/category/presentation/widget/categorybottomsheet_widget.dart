import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';
import 'package:todoapp2_flutter/core/common/input_component.dart';
import 'package:todoapp2_flutter/features/category/presentation/widget/color_picker.dart';
import 'package:todoapp2_flutter/features/category/presentation/controller/category_controller.dart';

void showCupertinoBottomSheet(
    BuildContext context, CategoryController controller) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextComponent(
                  'Enter New Details',
                  fontsize: 18,
                  fontweight: FontWeight.w600,
                  textcolor: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextSpecialInputField(
                    fillColor: Colors.white,
                    controller: controller.nameController,
                    label: 'Name',
                    hintText: 'Example - Sports, Art',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextSpecialInputField(
                    fillColor: Colors.white,
                    controller: controller.colorController,
                    onChanged: (value) {
                      print(value);
                      try {
                        if (value == null || value.isEmpty) return;
                        String sanitizedValue = value.replaceAll('#', '');
                        controller.colorController.text = '#$sanitizedValue';
                        controller.selectedColor.value =
                            Color(int.parse("0xFF$sanitizedValue"));
                      } catch (e) {
                        print("Erreur de conversion de la couleur : $e");
                      }
                    },
                    label: 'Color',
                    hintText: '#FE8210',
                    suffixIcon: Padding(
                      padding:
                          const EdgeInsets.only(right: 24, top: 08, bottom: 08),
                      child: colorPicker(
                        context,
                        controller,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(
                  () => simpleButtonLoading("Save changes", kcBlueColor, context,
                      () {
                    Category newCategory = Category(
                      name: controller.nameController.text,
                      color: controller.colorController.text.replaceAll('#', ''),
                      userId: sessionManager.signedInUser!.id!,
                    );
                    print('Sending data to server: ${newCategory.toJson()}');
                    controller.addCategory(newCategory, context);

                  }, controller.isLoading.value),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
