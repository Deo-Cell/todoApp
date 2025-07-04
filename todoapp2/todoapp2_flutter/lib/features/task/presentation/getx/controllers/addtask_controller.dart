import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/entities/category.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/taskscrud_usecase.dart';

class AddtaskController extends GetxController {
  final AddTaskUseCase addTaskUseCase;

  AddtaskController({required this.addTaskUseCase});

  // Variables réactives pour les champs
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxString category = ''.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  RxBool switchValue = false.obs;
  RxBool isReminder = false.obs;
  RxBool isLoading = false.obs;
  int categoryId = 0;

  @override
  void onInit() {
    super.onInit();
    _initializeFields();
  }

  void _initializeFields() {
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    title.value = arguments['title'] ?? '';
    description.value = arguments['description'] ?? '';
    final currentCategory = arguments['currentCategory'] ??
        CurrentCategory(id: 0, name: '', color: '000000');
    category.value = currentCategory.name!;
    categoryId = currentCategory.id!;
    switchValue.value = false;
    isReminder.value = false;
  }

  void resetFields() {
    title.value = '';
    description.value = '';
    category.value = '';

    switchValue.value = false;
    isReminder.value = false;
    categoryId = 0;
  }

  Future<void> addTask(Task newTask) async {
    isLoading.value = true;
    final result = await addTaskUseCase(newTask);
    isLoading.value = false;

    result.fold((failure) {
      print(failure.message);
    }, (success) {
      resetFields();
      Get.delete<AddtaskController>();
      Get.back();
    });
  }
}