import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_appbar.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/utils/date_format.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';
import 'package:todoapp2_flutter/core/common/input_component.dart';
import 'package:todoapp2_flutter/core/common/app_date_selector.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/addtask_controller.dart';

class AddTaskPage extends GetView<AddtaskController> {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    Duration initialTime = Duration(hours: 0, minutes: 0);
    DateTime? reminderTime;

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: CustomAppbar(
        title: 'Add a new task',
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FadeInUp(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: TextSpecialInputField(
                        onChanged: (value) => controller.title.value = value!,
                        label: 'Title',
                        hintText: 'Enter your task name here',
                        initialValue: controller.title.value,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: TextSpecialInputField(
                        onChanged: (value) =>
                            controller.description.value = value!,
                        label: 'Description',
                        hintText: 'Any specifics you want to mention?',
                        initialValue: controller.description.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: TextSpecialInputField(
                        onChanged: (value) => controller.category.value = value!,
                        label: 'Category',
                        hintText: 'Select a category',
                        initialValue: controller.category.value,
                        suffixIcon: InkWell(
                          onTap: () {
                            Get.toNamed(
                              '/category',
                              arguments: {
                                'title': controller.title.value,
                                'description': controller.description.value,
                                'date': controller.dateController.text,
                                'time': controller.timeController.text,
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.chevron_down,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextSpecialInputField(
                        controller: controller.dateController,
                        label: 'Date',
                        hintText: 'What is the deadline?',
                        suffixIcon: InkWell(
                          onTap: () {
                            showCupertinoDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              onDateChanged: (selectedDate1) {
                                selectedDate = selectedDate1.toLocal(); // Update to local time
                                controller.dateController.text =
                                    "${selectedDate.toLocal()}".split(' ')[0];
                                print("Selected date: $selectedDate");
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.calendar,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            "Do you want to set a reminder?",
                            fontsize: 14,
                            fontweight: FontWeight.w500,
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              activeTrackColor: kcBlueColor,
                              value: controller.switchValue.value,
                              onChanged: (value) {
                                controller.switchValue.value = value;
                                controller.isReminder.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (controller.isReminder.value)
                       Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextSpecialInputField(
                          controller: controller.timeController,
                          label: 'Reminder',
                          hintText: '--:-- am/pm',
                          suffixIcon: InkWell(
                            onTap: () {
                              showCupertinoTimePicker(
                                context: context,
                                initialTime: initialTime,
                                onTimeChanged: (Duration newTime) {
                                  print("New time: $newTime");
                                  initialTime = newTime;
                                  controller.timeController.text =
                                      formatTime(newTime);
                                  reminderTime = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    newTime.inHours,
                                    newTime.inMinutes.remainder(60),
                                  );
                                  print("Reminder time: $reminderTime");
                                },
                              );
                            },
                            child: Icon(
                              CupertinoIcons.time,
                              color: Colors.grey.shade600,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    simpleButtonLoading("Add Task", kcBlueColor, context, () {
                      Task newTask = Task(
                        title: controller.title.value,
                        description: controller.description.value,
                        categoryId: controller.categoryId,
                        deadline: selectedDate,
                        reminder: controller.isReminder.value
                            ? reminderTime?.toLocal()
                            : null,
                        isCompleted: false,
                        userId: sessionManager.signedInUser!.id!,
                      );
                      controller.addTask(newTask);
                      print("newTask: ${newTask.toJson()}");
                    }, controller.isLoading.value),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
