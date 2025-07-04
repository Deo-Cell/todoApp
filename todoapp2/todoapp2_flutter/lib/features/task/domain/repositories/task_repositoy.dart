import 'package:fpdart/fpdart.dart' hide Task;
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';

abstract interface class TaskRepositoy {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, bool>> addTask(Task newTask);
  Future<Either<Failure, bool>> updateTask(Task updatedTask);
  Future<Either<Failure, bool>> deleteTask(int taskId);
  Future<Either<Failure, List<Task>>> getNoonTasks(DateTime now);
  Future<Either<Failure, List<Task>>> getMorningTasks(DateTime now);
  Future<Either<Failure, List<Task>>> getEveningTasks(DateTime now);
  Future<Either<Failure, List<Task>>> getTasksCompleted(DateTime date);
}
