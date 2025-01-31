import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:qaisystore/controller/home/homescreen_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/double_back_to_close_snackbar.dart';
import 'package:qaisystore/view/widget/home/custombuttomappbar.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => Scaffold(
            floatingActionButton: Container(
              height: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: FloatingActionButton(
                backgroundColor: AppColors.cardColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: GetBuilder<HomeScreenControllerImp>(
                builder: ((controller) => const CustomButtomAppBar())),
            body: DoubleBackToCloseApp(
              snackBar: doubleBackToCloseSnackBar(),
              child: controller.listpage.elementAt(controller.currntpage),
            ))));
  }
}
