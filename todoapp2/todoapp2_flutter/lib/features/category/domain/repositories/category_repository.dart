import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Response>> addCategory(
      Category newCategory);
  Future<Either<Failure, bool>> deleteCategoryById(int id);
  Future<Either<Failure, Category?>> getCategoryById(int id);
}

