import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';
import 'package:todoapp2_flutter/features/category/data/datasources/category_datasource.dart';
import 'package:todoapp2_flutter/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource categoryDatasource;

  CategoryRepositoryImpl({required this.categoryDatasource});

  @override
  Future<Either<Failure, Response>> addCategory(
      Category newCategory) async {
    try {
      return right(await categoryDatasource.addCategory(newCategory));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    } 
  }

  
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      return right(await categoryDatasource.getCategories());
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCategoryById(int id) async {
    try {
      return right(await categoryDatasource.deleteCategoryById(id));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Category?>> getCategoryById(int id) async {
    try {
      return right(await categoryDatasource.getCategoryById(id));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
}
