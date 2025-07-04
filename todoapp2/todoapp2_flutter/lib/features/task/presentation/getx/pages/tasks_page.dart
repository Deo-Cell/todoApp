import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todoapp2_flutter/core/entities/task.dart';
import 'package:todoapp2_flutter/core/enum/task_status.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/widget/task_card.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/widget/empty_task.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/widget/task_statuts_selector.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/tasks_controller.dart';

class TasksPage extends GetView<TasksController> {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: kcBlueColor),
          );
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text('Error: ${controller.errorMessage.value}'),
          );
        }

        return SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildDateSelector(),
              const SizedBox(height: 30),
              FadeInUp(
                from: 80,
                duration: const Duration(seconds: 2),
                child: StatusSelector(
                  selectedStatus: controller.selectedStatus,
                  onStatusChanged: (status) {
                    controller.selectedStatus.value = status;
                    print("Selected status: ${controller.selectedStatus.value}");
                  },
                ),
              ),
              const SizedBox(height: 20),
              (controller.selectedStatus.value == TaskStatus.pending)
                  ? _pendingTasks()
                  : _completedTasks()
            ],
          ),
        );
      }),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(
              sessionManager.signedInUser?.imageUrl ?? "",
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: AnimatedTextKit(repeatForever: false, isRepeatingAnimation: false, animatedTexts: [
            TyperAnimatedText(
              "Hello ${sessionManager.signedInUser?.userName ?? ""}",
              speed: const Duration(milliseconds: 120),
              textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                 
                  ),
            ),
          ])),
          Badge(
            smallSize: 12,
            backgroundColor: kcRedColorDark,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.notifications_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _pendingTasks() {
    return Expanded(
      child: FadeInUp(
        from: 80,
        duration: const Duration(seconds: 2),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            if (controller.morningTasks.isEmpty &&
                controller.noonTasks.isEmpty &&
                controller.eveningTasks.isEmpty)
              emptyTask(),
            if (controller.morningTasks.isNotEmpty)
              _buildTaskSection(
                title: "Morning",
                tasks: controller.morningTasks,
              ),
            SizedBox(height: controller.morningTasks.isNotEmpty ? 20 : 0),
            if (controller.noonTasks.isNotEmpty)
              _buildTaskSection(
                title: "Noon",
                tasks: controller.noonTasks,
              ),
            SizedBox(height: controller.noonTasks.isNotEmpty ? 20 : 0),
            if (controller.eveningTasks.isNotEmpty)
              _buildTaskSection(
                title: "Evening",
                tasks: controller.eveningTasks,
              ),
          ],
        ),
      ),
    );
  }

  Widget _completedTasks() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          if (controller.completedTasks.isEmpty) emptyTaskCompleted(),
          if (controller.completedTasks.isNotEmpty)
            _buildTaskCompletedSection(
              tasks: controller.completedTasks,
            ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Obx(
            () => FadeInLeft(
             duration: const Duration(seconds: 2), 
              child: TextComponent(
                controller.dateController.formattedDate.value,
                fontsize: 18,
                fontweight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          arrowButton("left",
              () => controller.dateController.downgradeDate(controller)),
          const SizedBox(width: 16),
          arrowButton(
              "right", () => controller.dateController.upgradeDate(controller)),
        ],
      ),
    );
  }

  Widget _buildTaskSection(
      {required String title, required RxList<TaskWrapper> tasks}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextComponent(
          title,
          fontsize: 17,
          textcolor: kcGreyColor,
          fontweight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        ...tasks.map((task) {
          final index = tasks.indexOf(task);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: taskCard(task, controller, tasks, index),
          );
        }),
      ],
    );
  }

  Widget _buildTaskCompletedSection({required RxList<TaskWrapper> tasks}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ...tasks.map((task) {
          final index = tasks.indexOf(task);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: completedTaskCard(task, controller, tasks, index),
          );
        }),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        heroTag: 'addTaskButton',
        elevation: 5,
        splashColor: Colors.transparent,
        shape: const CircleBorder(),
        backgroundColor: kcBlueColor,
        onPressed: () {
          Get.toNamed('/addtask');
        },
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),
    );
  }
}
