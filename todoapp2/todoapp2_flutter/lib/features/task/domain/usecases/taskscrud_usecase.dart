import 'package:fpdart/fpdart.dart' hide Task;
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/params/no_params.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/features/task/domain/repositories/task_repositoy.dart';


class ListTasksUseCase implements Usecase<List<Task>, NoParams> {
  final TaskRepositoy taskRepositoy;
  ListTasksUseCase(this.taskRepositoy);

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) async {
    return taskRepositoy.getTasks();
  }
}

class AddTaskUseCase implements Usecase<bool, Task> {
  final TaskRepositoy taskRepositoy;
  AddTaskUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, bool>> call(Task params) async {
    return taskRepositoy.addTask(params);
  }
}

class UpdateTaskUseCase implements Usecase<bool, Task> {
  final TaskRepositoy taskRepositoy;
  UpdateTaskUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, bool>> call(Task params) async {
    return taskRepositoy.updateTask(params);
  }
}

class DeleteTaskUseCase implements Usecase<bool, int> {
  final TaskRepositoy taskRepositoy;
  DeleteTaskUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, bool>> call(int params) async {
    return taskRepositoy.deleteTask(params);
  }
}

class GetTasksCompletedUseCase implements Usecase<List<Task>, DateTime> {
  final TaskRepositoy taskRepositoy;
  GetTasksCompletedUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, List<Task>>> call(DateTime params) async {
    return taskRepositoy.getTasksCompleted(params);
  }
}

