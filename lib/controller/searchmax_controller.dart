import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/data/datasource/remote/searchdata.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';

class SearchMaxController extends GetxController {
  SearchDataRemote searchDataRemote = SearchDataRemote(Get.find());
  late StatusRequest statusRequest;
// ItemsModel? itemsModel;
  List<ItemsModel> datasearch = [];
  TextEditingController? search;
  bool? issearch = false;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      issearch = false;
    }
    update();
  }

  onSearch() {
    issearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchDataRemote.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        datasearch.clear();
        List dataresponse = response['data'];
        datasearch.addAll(dataresponse.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItemsDetalis(itemsModel) {
    Get.offAndToNamed(AppRoute.itemsdetails,
        arguments: {"itemsdetalis": itemsModel});
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }
}
