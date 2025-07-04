import 'package:fpdart/fpdart.dart';
import '../repositories/category_repository.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';


class AddcategoryUsecases implements Usecase<Response, Category> {
  final CategoryRepository categoryRepository;
  AddcategoryUsecases(this.categoryRepository);
  @override
  Future<Either<Failure, Response>> call(Category params) async {
    try {
      print('AddcategoryUsecases - Received category: ${params.toJson()}');
      final result = await categoryRepository.addCategory(params);
      print('AddcategoryUsecases - Repository result: $result');
      return result;
    } catch (e, stackTrace) {
      print('AddcategoryUsecases - Error: $e');
      print('AddcategoryUsecases - Stacktrace: $stackTrace');
      return left(Failure(e.toString()));
    }
  }
}
