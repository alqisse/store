// ignore: depend_on_referenced_packages
import 'package:qaisystore/controller/searchmax_controller.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/homedata.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

abstract class HomePageController extends SearchMaxController {
  getdata();
  initialData();
  goToNotifications();
  goToItems(List categories, int selectedcat, String categoryid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  HomePageDataRemote homePageDataRemote = HomePageDataRemote(Get.find());

  List categories = [];
  String? lang;
  List itmes = [];
  List settingstxt = [];

  String? username;

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageDataRemote.getData();
    print("================================= Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        itmes.addAll(response['itmes']);
        settingstxt.addAll(response['settingtxt']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  onRefresh() async {
    var response = await homePageDataRemote.getData();
    print("================================= Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.clear();
        itmes.clear();
        settingstxt.clear();
        categories.addAll(response['categories']);
        itmes.addAll(response['itmes']);
        settingstxt.addAll(response['settingtxt']);
      } else {
        Get.rawSnackbar(message: 'لايوجد إتصال بالشبكة');
      }
    }
  }

  @override
  void onInit() {
    search = TextEditingController();
    // FirebaseMessaging.instance.subscribeToTopic("users");
    getdata();
    initialData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedcat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categroies": categories,
      "selectedcat": selectedcat,
      "categoryid": categoryid
    });
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  goToNotifications() {
    Get.toNamed(AppRoute.notifications);
  }
}
