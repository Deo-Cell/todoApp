import 'package:get/get.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/task/data/datasources/task_datasource.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/taskscrud_usecase.dart';
import 'package:todoapp2_flutter/features/task/domain/repositories/task_repositoy.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/getdailytasks_usecase.dart';
import 'package:todoapp2_flutter/features/task/data/repositories/task_repository_impl.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/date_controller.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/tasks_controller.dart';

class TaskBinding extends MBindingsBuilder {
  final Client client;

  TaskBinding(this.client)
      : super(() => [
              Bind.lazyPut<TaskDatasource>(
                  () => TaskDatasourceImpl(client: client)),
              Bind.lazyPut<TaskRepositoy>(() => TaskRepositoryImpl(Get.find())),
              Bind.lazyPut<ListTasksUseCase>(
                  () => ListTasksUseCase(Get.find())),
              Bind.lazyPut<GetmorningtasksUseCase>(
                  () => GetmorningtasksUseCase(Get.find())),
              Bind.lazyPut<GetnoonntasksUseCase>(
                  () => GetnoonntasksUseCase(Get.find())),
              Bind.lazyPut<GeteveningtasksUseCase>(
                  () => GeteveningtasksUseCase(Get.find())),
              Bind.lazyPut<UpdateTaskUseCase>(
                  () => UpdateTaskUseCase(Get.find())),
              Bind.lazyPut<GetTasksCompletedUseCase>(
                  () => GetTasksCompletedUseCase(Get.find())),
              Bind.lazyPut<TasksController>(
                  () => TasksController(listTasks: Get.find(), getDailyTasks: Get.find(), getNoonTasks: Get.find(), getEveningTasks: Get.find(), updateTaskUseCase: Get.find(), getCompletedTasks: Get.find())),
              Bind.lazyPut<DateController>(() => DateController()),
            ]);
}
