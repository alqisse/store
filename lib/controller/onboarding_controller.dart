import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

//الابستراكت مهمته يوضح الميثودات المستخدمه بكل الاسكرين بسهوله
abstract class OnBoardingController extends GetxController {
  MyServices myServices = Get.find();
  //للتنقل للصفحه التاليه عند الضغط على البتن
  next();
  //للتفاعل اثناء التنقل بين الصفحات
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  //
  late PageController pageController;
  late String lang;
  int currentPage = 0;

  skip() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString("lang")!;
    pageController = PageController();
    super.onInit();
  }
}
