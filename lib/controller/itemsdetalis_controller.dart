// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/cart/cart_data.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetalisController extends GetxController {
  late ItemsModel itemsModel;

  CartDataRemote cartDataRemote = CartDataRemote(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  int itemsCount = 0;

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsdetalis'];
    itemsCount = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartDataRemote.getCountItemsData(
        myServices.sharedPreferences.getString("id"), itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      int count = 0;
      if (response['status'] == 'success') {
        count = response['data'];
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  addItems(String itemsid, String itemsprice, String itemsdicount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDataRemote.addData(
        myServices.sharedPreferences.getString("id"),
        itemsid,
        itemsprice,
        itemsdicount);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(padding: const EdgeInsets.all(30), message: "101".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addToCart() {
    addItems(
        itemsModel.itemsId!, itemsModel.itemsPrice!, itemsModel.itemsDiscount!);
    itemsCount++;
    update();
  }

  deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDataRemote.deleteData(
        myServices.sharedPreferences.getString("id"), itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(padding: const EdgeInsets.all(30), message: "122".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromCart() {
    if (itemsCount > 0) {
      deleteItems(itemsModel.itemsId!);
      itemsCount--;
      update();
    }
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
