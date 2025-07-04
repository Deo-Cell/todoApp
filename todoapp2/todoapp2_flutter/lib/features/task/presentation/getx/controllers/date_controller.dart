import 'package:get/get.dart';
import 'package:todoapp2_flutter/core/utils/date_format.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/tasks_controller.dart';

class DateController extends GetxController {
  var today = DateTime.now();
  Rx<String> formattedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();

    formattedDate.value = formatCustomDate(today);

    print("[DateController] Initial date: $today (${formattedDate.value})");
  }

  void setDate(DateTime newDate, TasksController taskController) {
    print("[DateController] Updating date from $today to $newDate");

    today = newDate;
    formattedDate.value = formatCustomDate(today);

    print("[DateController] Formatted new date: ${formattedDate.value}");

    fetchTasks(taskController);
  }

  void upgradeDate(TasksController taskController) {
    print("[DateController] Incrementing date by 1 day");

    setDate(today.add(Duration(days: 1)), taskController);
  }


  void downgradeDate(TasksController taskController) {
    print("[DateController] Decrementing date by 1 day");

    final newDate = today.subtract(Duration(days: 1));

    setDate(newDate, taskController);
  }

  void fetchTasks(TasksController taskController) {
    print("[DateController] Fetching tasks for date: $today (${formattedDate.value})");

    taskController.fetchMorningTasks();
    taskController.fetchNoonTasks();
    taskController.fetchEveningTasks();
    taskController.fetchCompletedTasks(today);
  }
}