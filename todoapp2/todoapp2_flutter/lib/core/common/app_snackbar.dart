import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void alertAndroid(BuildContext context , String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: double.infinity,
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12), // Arrondi pour iOS
        ),
        child:  Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white, size: 24),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}

void alertIos(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text("Error occured"),
        content:  Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
