import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/exceptions.dart';

abstract interface class CategoryDatasource {
  Future<List<Category>> getCategories();

  Future<Response> addCategory(Category newCategory);

  Future<Category?> getCategoryById(int id);

  Future<bool> deleteCategoryById(int id);
}

class CategoryDatasourceImpl implements CategoryDatasource {
  final Client client;

  CategoryDatasourceImpl(this.client);

  @override
  Future<List<Category>> getCategories() async {
    try {
      return await client.category.getCategories();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Response> addCategory(Category newCategory) async {
    try {
      return await client.category.addCategory(newCategory);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> deleteCategoryById(int id) async {
    try {
      return await client.category.deleteCategoryById(id);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  @override
  Future<Category?> getCategoryById(int id) async {
    try {
      return await client.category.getCategoryById(id);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
