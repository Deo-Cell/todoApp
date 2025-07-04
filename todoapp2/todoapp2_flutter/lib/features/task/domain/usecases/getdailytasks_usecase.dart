import 'package:fpdart/fpdart.dart' hide Task;
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/features/task/domain/repositories/task_repositoy.dart';



class GetmorningtasksUseCase implements Usecase<List<Task>, DateTime>  {
   final TaskRepositoy taskRepositoy;
  GetmorningtasksUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, List<Task>>> call(DateTime params) async {
    return taskRepositoy.getMorningTasks(params);
  }
}

class GetnoonntasksUseCase implements Usecase<List<Task>, DateTime>  {
   final TaskRepositoy taskRepositoy;
  GetnoonntasksUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, List<Task>>> call(DateTime params) async {
    return taskRepositoy.getNoonTasks(params);
  }
}

class GeteveningtasksUseCase implements Usecase<List<Task>, DateTime>  {
   final TaskRepositoy taskRepositoy;
  GeteveningtasksUseCase(this.taskRepositoy);
  @override
  Future<Either<Failure, List<Task>>> call(DateTime params) async {
    return taskRepositoy.getEveningTasks(params);
  }
}