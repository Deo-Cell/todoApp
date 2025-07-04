import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../controller/category_controller.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';

List<Color> colors = [
  kcBlueColor,
  kcRedColorDark,
  kcPurpleColor,
  kcGreenColor,
  kcOrangeColor,
  Colors.black,
  Colors.pink,
  Colors.pinkAccent,
  Colors.yellow,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.deepPurple,
  Colors.teal,
  Colors.indigo,
  Colors.lime,
  Colors.brown,
  Colors.cyan,
  Colors.amber,
  Colors.blueGrey,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.orangeAccent,
  Colors.redAccent,
];

Widget colorPicker(BuildContext context, CategoryController controller) {
  return InkWell(
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 8, right: 2, top: 16, bottom: 40),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: colors.map((newColor) {
                  return GestureDetector(
                    onTap: () {
                      controller.changeColor(newColor);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: newColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
    },
    child: Obx(
      () => Container(
        height: 10,
        width: 30,
        decoration: BoxDecoration(
          color: controller.selectedColor.value, 
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
