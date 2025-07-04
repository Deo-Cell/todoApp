import 'package:get/get.dart';
import 'package:todoapp2_flutter/core/entities/task.dart';
import 'package:todoapp2_flutter/core/enum/task_status.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/taskscrud_usecase.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/getdailytasks_usecase.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/date_controller.dart';

class TasksController extends GetxController {
  final ListTasksUseCase listTasks;
  final GetmorningtasksUseCase getDailyTasks;
  final GetnoonntasksUseCase getNoonTasks;
  final GeteveningtasksUseCase getEveningTasks;
  final UpdateTaskUseCase updateTaskUseCase;
  final GetTasksCompletedUseCase getCompletedTasks;
  final DateController dateController = Get.find<DateController>();

  TasksController({
    required this.listTasks,
    required this.getDailyTasks,
    required this.getNoonTasks,
    required this.getEveningTasks,
    required this.updateTaskUseCase,
    required this.getCompletedTasks
  }) : super();

  RxList<TaskWrapper> morningTasks = <TaskWrapper>[].obs;
  RxList<TaskWrapper> noonTasks = <TaskWrapper>[].obs;
  RxList<TaskWrapper> eveningTasks = <TaskWrapper>[].obs;
  RxList<TaskWrapper> completedTasks = <TaskWrapper>[].obs;

  var today = DateTime.now();
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  final selectedStatus = TaskStatus.pending.obs;

  @override
  void onInit() {
    super.onInit();

    print("[TasksController] Initializing tasks for date: $today");

    fetchMorningTasks();
    fetchNoonTasks();
    fetchEveningTasks();
    fetchCompletedTasks(today);
  }

  Future<void> fetchMorningTasks() async {
    isLoading.value = true;
    errorMessage.value = "";

    final currentDate = dateController.today;

    print("[TasksController] Fetching morning tasks for date: $currentDate");

    final result = await getDailyTasks(currentDate);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;

        print(
            "[TasksController] Error fetching morning tasks: ${failure.message}");
      },
      (taskList) {
        morningTasks.value =
            taskList.map((task) => TaskWrapper(task: task)).toList();
        isLoading.value = false;

        print(
            "[TasksController] Morning tasks fetched: ${morningTasks.length} tasks");
      },
    );
  }

  Future<void> fetchNoonTasks() async {
    isLoading.value = true;
    errorMessage.value = "";

    final currentDate = dateController.today;

    print("[TasksController] Fetching noon tasks for date: $currentDate");

    final result = await getNoonTasks(currentDate);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;

        print(
            "[TasksController] Error fetching noon tasks: ${failure.message}");
      },
      (taskList) {
        noonTasks.value =
            taskList.map((task) => TaskWrapper(task: task)).toList();
        isLoading.value = false;

        print(
            "[TasksController] Noon tasks fetched: ${noonTasks.length} tasks");
      },
    );
  }

  Future<void> fetchEveningTasks() async {
    isLoading.value = true;
    errorMessage.value = "";

    final currentDate = dateController.today;

    print("[TasksController] Fetching evening tasks for date: $currentDate");

    final result = await getEveningTasks(currentDate);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;

        print(
            "[TasksController] Error fetching evening tasks: ${failure.message}");
      },
      (taskList) {
        eveningTasks.value =
            taskList.map((task) => TaskWrapper(task: task)).toList();
        isLoading.value = false;

        print(
            "[TasksController] Evening tasks fetched: ${eveningTasks.length} tasks");
      },
    );
  }

  Future<void> updateTask(TaskWrapper task) async {
    isLoading.value = true;
    errorMessage.value = "";

    final result = await updateTaskUseCase(task.task);

    result.fold((failure) {
      errorMessage.value = failure.message;
      isLoading.value = false;
      print("[TasksController] Error updating task: ${failure.message}");
    }, (success) {
      isLoading.value = false;
      print("[TasksController] Task updated successfully");
    });
  }

  Future<void> fetchCompletedTasks(DateTime date) async {
    isLoading.value = true;
    errorMessage.value = "";

    final result = await getCompletedTasks(date);

    result.fold((failure) {
      errorMessage.value = failure.message;
      isLoading.value = false;
      print("[TasksController] Error fetching completed tasks: ${failure.message}");
    }, (taskList) {
      completedTasks.value =
          taskList.map((task) => TaskWrapper(task: task)).toList();
      isLoading.value = false;
      print("[TasksController] Completed tasks fetched: ${completedTasks.length} tasks");
    });
  }


  void toggleTaskDone(RxList<TaskWrapper> tasks, int index) {
    final taskWrapper = tasks[index];
    taskWrapper.isCompleted.value = !taskWrapper.isCompleted.value;
    print( "[TasksController] Toggling task done status. Task ID: ${taskWrapper.task.id}, New Status: ${taskWrapper.isCompleted.value}");
    taskWrapper.syncWithModel();
  }
}
