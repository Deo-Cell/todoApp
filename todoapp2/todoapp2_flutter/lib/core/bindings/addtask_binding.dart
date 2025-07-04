import 'package:get/get.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/task/data/datasources/task_datasource.dart';
import 'package:todoapp2_flutter/features/task/domain/usecases/taskscrud_usecase.dart';
import 'package:todoapp2_flutter/features/task/domain/repositories/task_repositoy.dart';
import 'package:todoapp2_flutter/features/task/data/repositories/task_repository_impl.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/addtask_controller.dart';

class AddtaskBinding extends MBindingsBuilder {
  AddtaskBinding()
      : super(() => [
              Bind.lazyPut<TaskDatasource>(
                  () => TaskDatasourceImpl(client: client)),
              Bind.lazyPut<AddTaskUseCase>(
                  () => AddTaskUseCase(Get.find())),
              Bind.lazyPut<TaskRepositoy>(() => TaskRepositoryImpl(Get.find())),
              Bind.lazyPut<AddtaskController>(
                  () => AddtaskController(addTaskUseCase: Get.find()), fenix: true, ),
            ]);
}
