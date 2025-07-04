import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/entities/task.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/tasks_controller.dart';

Widget taskCard(TaskWrapper taskwrapper, TasksController controller,
    RxList<TaskWrapper> tasks, int index) {
  return FutureBuilder<Category?>(
    future: client.category.getCategoryById(taskwrapper.task.categoryId!),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          strokeWidth: 0,
        );
      } else if (snapshot.hasError) {
        return Text('Erreur: ${snapshot.error}');
      } else {
        Category? category = snapshot.data;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 12,
                decoration: BoxDecoration(
                  color: Color(int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => Transform.scale(
                  scale: 1.75,
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor:
                        Color(int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                    value: taskwrapper.isCompleted.value,
                    onChanged: (val) {
                      controller.toggleTaskDone(tasks, index);
                      if (taskwrapper.task.isCompleted) {
                        TaskWrapper taskWrapper = tasks[index];
                        taskWrapper.task.isCompleted = true;
                        print("Task is completed: ${taskWrapper.task.isCompleted}");
                        controller.updateTask(taskWrapper);
                      }

                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskwrapper.task.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      taskwrapper.task.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(
                            int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          category?.name ?? '',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${taskwrapper.task.reminder!.hour % 12 == 0 ? 12 : taskwrapper.task.reminder!.hour % 12}:${taskwrapper.task.reminder!.minute.toString().padLeft(2, '0')} ${taskwrapper.task.reminder!.hour > 12 ? 'pm' : 'am'}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    },
  );
}

Widget completedTaskCard(TaskWrapper taskwrapper, TasksController controller,
    RxList<TaskWrapper> tasks, int index) {
  return FutureBuilder<Category?>(
    future: client.category.getCategoryById(taskwrapper.task.categoryId!),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
          strokeWidth: 0,
        );
      } else if (snapshot.hasError) {
        return Text('Erreur: ${snapshot.error}');
      } else {
        Category? category = snapshot.data;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 12,
                decoration: BoxDecoration(
                  color: Color(int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => Transform.scale(
                  scale: 1.75,
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor:
                        Color(int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                    value: taskwrapper.isCompleted.value,
                    onChanged: (val) {

                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskwrapper.task.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      taskwrapper.task.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(
                            int.parse("0xFF${category?.color ?? 'FFFFFF'}")),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          category?.name ?? '',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${taskwrapper.task.reminder!.hour % 12 == 0 ? 12 : taskwrapper.task.reminder!.hour % 12}:${taskwrapper.task.reminder!.minute.toString().padLeft(2, '0')} ${taskwrapper.task.reminder!.hour > 12 ? 'pm' : 'am'}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    },
  );
}
