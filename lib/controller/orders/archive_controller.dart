import 'package:get/get.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/orders/archivedata.dart';
import 'package:qaisystore/data/model/ordersmodel.dart';

class ArchiveController extends GetxController {
  ArchiveDataRemote archiveDataRemote = ArchiveDataRemote(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  double? ratingorder;

  String printOrdertype(String val) {
    if (val == "1") {
      return "109".tr;
    } else {
      return "110".tr;
    }
  }

  String printpaymentmethod(String val) {
    if (val == "1") {
      return "112".tr;
    } else {
      return "111".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "103".tr;
    } else if (val == "1") {
      return "113".tr;
    } else if (val == "2") {
      return "121".tr;
    } else if (val == "3") {
      return "114".tr;
    } else {
      return "115".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveDataRemote.archiveOrdersData(
      myServices.sharedPreferences.getString("id"),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  ratingOrders(String orderid, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveDataRemote.ordersRatingData(
        orderid, rating.toString(), comment);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print("success");
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future refershOrders() async {
    try {
      var response = await archiveDataRemote.archiveOrdersData(
        myServices.sharedPreferences.getString("id"),
      );
      print(response);
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        data.clear();
        data.addAll(dataresponse.map((e) => OrdersModel.fromJson(e)));
      }
    } catch (on) {
      Get.snackbar("Error", "Not Connected");
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
