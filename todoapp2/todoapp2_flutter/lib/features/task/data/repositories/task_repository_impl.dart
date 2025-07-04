import 'package:fpdart/fpdart.dart' hide Task;
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';
import 'package:todoapp2_flutter/features/task/data/datasources/task_datasource.dart';
import 'package:todoapp2_flutter/features/task/domain/repositories/task_repositoy.dart';

class TaskRepositoryImpl implements TaskRepositoy {
  final TaskDatasource datasource;
  TaskRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      return right(await datasource.getTasks());
    } on ServerException catch (e) {
      throw left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addTask(Task newTask) async {
    try {
      return right(await datasource.addTask(newTask));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(int taskId) async {
    try {
      return right(await datasource.deleteTask(taskId));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTask(Task updatedTask) async {
    try {
      return right(await datasource.updateTask(updatedTask));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getNoonTasks(DateTime now) async {
    try {
      return right(await datasource.getNoonTasks(now));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getEveningTasks(DateTime now) async {
    try {
      return right(await datasource.getEveningTasks(now));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getMorningTasks(DateTime now) async {
    try {
      return right(await datasource.getMorningTasks(now));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasksCompleted(DateTime date) async {
    try {
      return right(await datasource.getTasksCompleted(date));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
