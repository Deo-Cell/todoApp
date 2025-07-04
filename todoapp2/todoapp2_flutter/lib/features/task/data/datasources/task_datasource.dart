import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';

abstract interface class TaskDatasource {
  Future<List<Task>> getTasks();
  Future<List<Task>> getTasksCompleted(DateTime date);
  Future<bool> addTask(Task newTask);
  Future<bool> updateTask(Task updatedTask);
  Future<bool> deleteTask(int taskId);
  Future<List<Task>> getMorningTasks(DateTime now);
  Future<List<Task>> getEveningTasks(DateTime now);
  Future<List<Task>> getNoonTasks(DateTime now);
}

class TaskDatasourceImpl implements TaskDatasource {
  final Client client;

  TaskDatasourceImpl({required this.client});

  @override
  Future<List<Task>> getTasks() async {
    try {
      return await client.task.getTasks();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<bool> addTask(Task newTask) async {
    try {
      return await client.task.addTask(newTask);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<bool> deleteTask(int taskId) async {
    try {
      return await client.task.deleteTask(taskId);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<List<Task>> getEveningTasks(DateTime now) async {
    try {
      return await client.task.getEveningTasks(now);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<List<Task>> getMorningTasks(DateTime now) async {
    try {
      return await client.task.getMorningTasks(now);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<List<Task>> getNoonTasks(DateTime now) async {
    try {
      return await client.task.getNoonTasks(now);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<bool> updateTask(Task updatedTask) async {
    try {
      return await client.task.updateTask(updatedTask);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<List<Task>> getTasksCompleted(DateTime date) {
    try {
      return client.task.getTasksCompleted(date);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
