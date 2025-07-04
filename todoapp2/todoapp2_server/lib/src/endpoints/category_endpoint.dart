import 'package:serverpod/server.dart';
import 'package:todoapp2_server/src/generated/protocol.dart';

class CategoryEndpoint extends Endpoint {
  Future<List<Category>> getCategories(Session session) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signin.');
    }
    final userId = authInfo.userId;
    return await Category.db.find(
      session,
      where: (categorytable) => categorytable.userId.equals(userId),
    );
  }
    Future<Category?> getCategoryById(Session session, int id) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signed in.');
    }
    final userId = authInfo.userId;
    return await Category.db.findById(session, id);
  }

  Future<Response> addCategory(Session session, Category newCategory) async {
    final authInfo = await session.authenticated;

    if (authInfo == null) {
      throw Exception('User not signed in.');
    }

    final userId = authInfo.userId;
    newCategory.userId = userId;

    List<Category> categories = await getCategories(session);
    bool categoryExists = categories.any((category) =>
        category.name.toLowerCase() == newCategory.name.toLowerCase());

    if (categoryExists) {
      return Response(success: false, message: "Category already exists");
    } else {
      await Category.db.insertRow(session, newCategory);
      return Response(success: true, message: "Category added successfully");
    }
  }

  Future<bool> deleteCategoryById(Session session, int categoryId) async {
    List<Category> categories = await getCategories(session);
    bool categoryExists = categories.any((c) => c.id == categoryId);

    if (categoryExists) {
      Category categoryToDelete =
          categories.firstWhere((c) => c.id == categoryId);
      await Category.db.deleteRow(session, categoryToDelete);
      return true;
    } else {
      return false;
    }
  }
}
