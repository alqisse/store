import 'package:qaisystore/controller/items_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changrCat(i!, categoriesModel.categoriesId);
          // controller.goToItems(controller.categories, i!);
        },
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              //  heig,
              // width: 70,
              decoration: BoxDecoration(
                  color:
                      controller.selectedcat == i ? AppColors.thirdColor : null,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "${translationDatabase(categoriesModel.categoriesNamaAr!, categoriesModel.categoriesName!)}",
                style: const TextStyle(fontSize: 20, color: AppColors.grey2),
              )),
        ));
  }
}
