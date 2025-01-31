// ignore: depend_on_referenced_packages
import 'package:qaisystore/controller/home/homepage_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/categoriesmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomCategoriesHome extends GetView<HomePageControllerImp> {
  const CustomCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        clipBehavior: Clip.none,
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

class Categories extends GetView<HomePageControllerImp> {
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
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // height: 70,
          width: 150,
          decoration: const BoxDecoration(
              color: AppColors.kPrimaryLightColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Image.asset("assets/images/1.png",width: 100,height: 150,fit: BoxFit.fill,),

              Positioned(
                top: -25,
                left: 150 / 3,
                child: SvgPicture.network(
                  "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
                  alignment: Alignment.center,
                  color: AppColors.primaryColor.withRed(220),
                  width: 40,
                ),
              ),
              Center(
                child: Text(
                  "${translationDatabase(categoriesModel.categoriesNamaAr!, categoriesModel.categoriesName!)}",
                  style: const TextStyle(fontSize: 22, color: AppColors.grey2),
                ),
              ),
            ],
          )),
    );
  }
}
