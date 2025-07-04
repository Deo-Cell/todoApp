import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../widget/categorybottomsheet_widget.dart';
import 'package:todoapp2_flutter/core/entities/category.dart';
import 'package:todoapp2_flutter/core/common/app_appbar.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';
import 'package:todoapp2_flutter/core/common/app_buttons.dart';
import 'package:todoapp2_flutter/features/category/presentation/controller/category_controller.dart';
import 'package:todoapp2_flutter/features/task/presentation/getx/controllers/addtask_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments['title'];
    var description = Get.arguments['description'];
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: CustomAppbar(
        title: 'Categories',
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: addCategoryButton(() {
                      showCupertinoBottomSheet(context, controller);
                    })),
                const SizedBox(height: 20),
                Obx(
                  () => FadeInUp(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: controller.categories
                          .map((category) => InkWell(
                                onTap: () {
                                  CurrentCategory currentCategory =
                                      CurrentCategory(
                                    id: category.id!,
                                    name: category.name,
                                    color: category.color,
                                  );
                    
                                  Get.offNamed('/addtask', arguments: {
                                    'currentCategory': currentCategory,
                                    'title': title,
                                    'description': description
                                  });
                                },
                                child: showCategoryButton(
                                    category.color, category.name),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
