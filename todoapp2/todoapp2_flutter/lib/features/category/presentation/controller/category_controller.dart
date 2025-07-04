import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/params/no_params.dart';
import 'package:todoapp2_client/todoapp2_client.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/addcategory_usecases.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/deletecategory_usecase.dart';
import 'package:todoapp2_flutter/features/category/domain/usescases/getcategories_usescases.dart';

class CategoryController extends GetxController {
  final AddcategoryUsecases addCategoryUseCase;
  final GetcategoriesUsescases getCategoriesUseCase;
  final DeletecategoryUsecase deleteCategoryUseCase;
  final isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  Rx<Color> selectedColor = kcOrangeColor.obs;
  RxList<Category> categories = <Category>[].obs;
  CategoryController(
      {required this.addCategoryUseCase,
      required this.getCategoriesUseCase,
      required this.deleteCategoryUseCase});

  void changeColor(Color newColor) {
    selectedColor.value = newColor;
    colorController.text = colorToHexRGB(newColor);
  }

  Future<void> addCategory(Category newCategory, BuildContext context) async {
    isLoading.value = true;
    try {
      print('Attempting to add category: ${newCategory.toJson()}');
      final result = await addCategoryUseCase(newCategory);
      isLoading.value = false;
      result.fold((failure) {
        print('Category Add Failure: ${failure.message}');
      }, (response) {
        print('Category Add Response: $response');
        Get.delete<CategoryController>();
        Navigator.pop(context);
      });
    } catch (e, stackTrace) {
      isLoading.value = false;
      print('Unexpected error adding category: $e');
      print('Stacktrace: $stackTrace');
    }
  }

  Future<void> deleteCategory(int id) async {
    isLoading.value = true;
    final result = await deleteCategoryUseCase(id);
    isLoading.value = false;
    result.fold((failure) {
      print(failure.message);
    }, (success) {
      print(success);
    });
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    final result = await getCategoriesUseCase(NoParams());
    isLoading.value = false;
    result.fold((failure) {
      print(failure.message);
    }, (category) {
      this.categories.value = category;
      print(categories);
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
