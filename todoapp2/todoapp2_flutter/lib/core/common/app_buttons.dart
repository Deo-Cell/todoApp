import 'package:get/get.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';

ElevatedButton simpleButton(
    String text, Color color, BuildContext context, Function() onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 11),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

ElevatedButton simpleButtonLoading(String text, Color color,
    BuildContext context, Function() onTap, bool isLoading) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 11),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: isLoading
            ? SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    ),
  );
}

Widget simpleButtonComponent(
    String text, BuildContext context, Function() onTap) {
  return Bounce(
    duration: const Duration(milliseconds: 100),
    child: Container(
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: kcBlueColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14, color: kcBlueColor, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

Widget arrowButton(String directions, Function()? onPressed) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.black,
      shape: BoxShape.circle,
    ),
    child: GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: directions == "left" ? 4 : 0),
          child: Icon(
            directions == "left"
                ? Icons.arrow_back_ios
                : Icons.arrow_forward_ios,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget addCategoryButton(Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0XFFE4E5E6),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          const SizedBox(width: 16),
          Icon(
            Icons.add,
            size: 24,
            color: Colors.black,
          ),
          const Text(
            "Create new category",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Container showCategoryButton(String color, String name) {
  return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(int.parse("0xFF$color")),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          TextComponent(name,
              fontsize: 14,
              fontweight: FontWeight.w700,
              textcolor: Colors.white)
        ],
      ));
}
