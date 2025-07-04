import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';

Widget emptyTask() {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 80),
        Image.asset(
          "assets/images/emptytask.png",
          width: 190,
          height: 190,
          color: Colors.grey.shade400,
        ),
        const Text(
          "Nothing's here",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Start off by adding some to-do's and keep\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t track of them.",
          style: TextStyle(
            fontSize: 12,
            color: kcMediumGrey,
          ),
        ),
      ],
    ),
  );
}

Widget emptyTaskCompleted() {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 80),
        Image.asset(
          "assets/images/emptytask.png",
          width: 190,
          height: 190,
          color: Colors.grey.shade400,
        ),
        const Text(
          "You haven't completed anything.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Complete some tasks to shift some over here.",
          style: TextStyle(
            fontSize: 12,
            color: kcMediumGrey,
          ),
        ),
      ],
    ),
  );
}