import 'package:fpdart/fpdart.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/error/failure.dart';
import 'package:todoapp2_flutter/core/params/no_params.dart';
import 'package:todoapp2_flutter/core/usecases/usecase.dart';
import 'package:todoapp2_flutter/features/category/domain/repositories/category_repository.dart';


class GetcategoriesUsescases implements Usecase<List<Category>, NoParams>  {

  final CategoryRepository categoryRepository;

  GetcategoriesUsescases(this.categoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await categoryRepository.getCategories();
  }
}

class GetCategoryByIdUsescases implements Usecase<Category?, int>  {

  final CategoryRepository categoryRepository;

  GetCategoryByIdUsescases(this.categoryRepository);  

  @override
  Future<Either<Failure, Category?>> call(int id) async {
    return await categoryRepository.getCategoryById(id);
  }
}

