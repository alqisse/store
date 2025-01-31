import 'package:qaisystore/controller/searchmax_controller.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/items/itemsdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMaxController {
  initialData();
  changrCat(int? val, String? valcatid);
  getItems(String catid);
}

class ItemsControllerImp extends ItemsController {
  ItemsDataRemote itemsDataRemote = ItemsDataRemote(Get.find());
  MyServices myServices = Get.find();
  @override
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  List categories = [];
  int? selectedcat;
  String? categoryid;

  @override
  initialData() {
    categories = Get.arguments['categroies'];
    selectedcat = Get.arguments['selectedcat'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    data.clear();
    initialData();

    super.onInit();
  }

  @override
  changrCat(val, valcatid) {
    selectedcat = val;
    categoryid = valcatid;
    getItems(categoryid!);
  }

  @override
  getItems(String catid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsDataRemote.getData(
        catid, myServices.sharedPreferences.getString("id"));
    print("================================= Controller $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  goToCart() {
    Get.offNamed(AppRoute.cart);
  }
}
