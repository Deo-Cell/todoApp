import 'package:serverpod/server.dart';
import 'package:todoapp2_server/src/generated/protocol.dart';

class TaskEndpoint extends Endpoint {
  Future<List<Task>> getTasks(Session session) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signin.');
    }

    final userId = authInfo.userId;

    return await Task.db.find(
      session,
      where: (task) => task.userId.equals(userId),
    );
  }

  Future<List<Task>> getTasksCompleted(Session session, DateTime date) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signin.');
    }

    final userId = authInfo.userId;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await Task.db.find(
      session,
      where: (taskTable) =>
          taskTable.isCompleted.equals(true) &
          taskTable.userId.equals(userId) &
          taskTable.reminder.between(startOfDay, endOfDay),
    );
  }

  Future<List<Task>> getTasksPended(Session session, DateTime date) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signed in.');
    }

    final userId = authInfo.userId;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await Task.db.find(
      session,
      where: (taskTable) =>
          taskTable.isCompleted.equals(false) &
          taskTable.userId.equals(userId) &
          (taskTable.createdAt >= startOfDay) &
          (taskTable.createdAt < endOfDay),
    );
  }

  Future<List<Task>> getMorningTasks(Session session, DateTime now) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signed in.');
    }
    final userId = authInfo.userId;

    var startOfMorning = DateTime(now.year, now.month, now.day, 0); // 00h00
    var endOfMorning = DateTime(now.year, now.month, now.day, 12); // 11h59

    print('MorningDay: $now');

    print('Start of morning (UTC): $startOfMorning');
    print('End of morning (UTC): $endOfMorning');

    var morningTasks = await Task.db.find(
      session,
      where: (taskTable) =>
          taskTable.reminder.between(startOfMorning, endOfMorning) &
          taskTable.userId.equals(userId) & taskTable.isCompleted.equals(false),
    );

    print('Morning tasks found: ${morningTasks.length}');
    for (var task in morningTasks) {
      print('Task: ${task.title}, Reminder: ${task.reminder}');
    }

    return morningTasks;
  }

  Future<List<Task>> getEveningTasks(Session session, DateTime now) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signin.');
    }
    final userId = authInfo.userId;

    var startOfEvening = DateTime(now.year, now.month, now.day, 16); // 16h00
    var endOfEvening = DateTime(now.year, now.month, now.day, 24); // 23h59
    print("EveningDay: $now\n");
    print('Start of evening (UTC): $startOfEvening\n');
    print('End of evening (UTC): $endOfEvening\n');

    var eveningTasks = await Task.db.find(
      session,
      where: (taskTable) =>
          taskTable.reminder.between(startOfEvening, endOfEvening) &
          taskTable.userId.equals(userId) & taskTable.isCompleted.equals(false),
    );

    print('Evening tasks found: ${eveningTasks.length}\n');
    for (var task in eveningTasks) {
      print('Task: ${task.title}, Created At: ${task.reminder}\n');
    }
    return eveningTasks;
  }

  Future<List<Task>> getNoonTasks(Session session, DateTime now) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw Exception('User not signin.');
    }
    final userId = authInfo.userId;
    var startOfNoon = DateTime(now.year, now.month, now.day, 12); // 12h00
    var endOfNoon = DateTime(now.year, now.month, now.day, 16); // 15h59

    print("NoonDay: $now\n");

    print('Start of noon (UTC): $startOfNoon \n');
    print('End of noon (UTC): $endOfNoon\n');

    
    var noonTasks = await Task.db.find(
      session,
      where: (taskTable) =>
          taskTable.reminder.between(startOfNoon, endOfNoon) &
          taskTable.userId.equals(userId) & taskTable.isCompleted.equals(false),
    );

    print('Noon tasks found: ${noonTasks.length}\n');
    for (var task in noonTasks) {
      print('Task: ${task.title}, Created At: ${task.reminder}\n');
    }
    return noonTasks;
  }

  Future<bool> addTask(Session session, Task newTask) async {
    try {
      final authInfo = await session.authenticated;
      final userId = authInfo!.userId;

      if (userId == null) {
        session.log('Utilisateur non authentifié.');
        return false;
      }

      newTask.createdAt = DateTime.now();
      newTask.userId = userId;

      await Task.db.insertRow(session, newTask);
      return true;
    } catch (e, stackTrace) {
      session.log('Erreur lors de l\'ajout de la tâche : $e');
      session.log('Stacktrace: $stackTrace');
      return false;
    }
  }

  Future<Task?> getTaskById(Session session, int id) async {
    return await Task.db.findById(session, id);
  }

  Future<List<Task>> getTasksByCategory(Session session, int categoryId) async {
    return await Task.db.find(
      session,
      where: (taskTable) => taskTable.categoryId.equals(categoryId),
    );
  }

  Future<bool> updateTask(Session session, Task updatedTask) async {
    var result = await Task.db.updateRow(session, updatedTask);
    return result != null;
  }

  Future<bool> deleteTask(Session session, int id) async {
    var task = await Task.db.findById(session, id);
    if (task != null) {
      await Task.db.deleteRow(session, task);
      return true;
    }
    return false;
  }
}
