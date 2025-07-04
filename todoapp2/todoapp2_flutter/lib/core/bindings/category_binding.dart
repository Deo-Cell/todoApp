import 'package:get/get.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_flutter/core/common/app_bidings.dart';
import 'package:todoapp2_flutter/features/category/data/datasources/category_datasource.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/addcategory_usecases.dart';
import 'package:todoapp2_flutter/features/category/domain/repositories/category_repository.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/deletecategory_usecase.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/getcategories_usescases.dart';
import 'package:todoapp2_flutter/features/category/data/repositories/category_repository._impl.dart';
import 'package:todoapp2_flutter/features/category/presentation/controller/category_controller.dart';

class CategoryBinding extends MBindingsBuilder {
  
  CategoryBinding()
      : super(() => [
              Bind.lazyPut<CategoryDatasource>(
                  () => CategoryDatasourceImpl(client)),
              Bind.lazyPut<CategoryRepository>(
                  () => CategoryRepositoryImpl(categoryDatasource: Get.find())),
              Bind.lazyPut<AddcategoryUsecases>(
                  () => AddcategoryUsecases(Get.find())),
              Bind.lazyPut<DeletecategoryUsecase>(
                  () => DeletecategoryUsecase(Get.find())),
              Bind.lazyPut<GetcategoriesUsescases>(
                  () => GetcategoriesUsescases(Get.find())),
              Bind.lazyPut<CategoryController>(() => CategoryController(
                  addCategoryUseCase: Get.find(),
                  deleteCategoryUseCase: Get.find(),
                  getCategoriesUseCase: Get.find())),
            ]);
}
