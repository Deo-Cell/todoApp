import 'package:flutter/cupertino.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';

void showCupertinoDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required ValueChanged<DateTime> onDateChanged,
}) {
  DateTime selectedDate = initialDate;

  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: TextComponent("Choose a date"),
        message: Container(
          height: 300,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            minimumDate: DateTime(2000),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              selectedDate = newDate; // Mettre à jour la date sélectionnée
            },
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              onDateChanged(selectedDate); // Transmettre la date sélectionnée
              Navigator.pop(context);
            },
            child: TextComponent(
              'Confirm',
              textcolor: kcBlueColor,
            ),
          ),
        ],
      );
    },
  );
}

void showCupertinoTimePicker({
  required BuildContext context,
  required Duration initialTime,
  required ValueChanged<Duration> onTimeChanged,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text("Choose a time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        message: Container(
          height: 300,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: initialTime,
            onTimerDurationChanged: onTimeChanged,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Confirm', style: TextStyle(color: kcBlueColor)),
          ),
        ],
      );
    }
  );
}