import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/features/category/domain/repositories/category_repository.dart';

class DeletecategoryUsecase implements Usecase<bool, int> {
  final CategoryRepository repository;

  DeletecategoryUsecase(this.repository);
  
  @override
  Future<Either<Failure, bool>> call(int params) {
    return repository.deleteCategoryById(params);
  }
}
