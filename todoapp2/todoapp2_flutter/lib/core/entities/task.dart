import 'package:get/get.dart';
import 'package:todoapp2_client/todoapp2_client.dart';

class TaskWrapper {
  Task task;
  late RxBool isCompleted;

  TaskWrapper({required this.task}) {
    isCompleted = task.isCompleted.obs;
  }

  void syncWithModel() {
    task.isCompleted = isCompleted.value;
  }
}