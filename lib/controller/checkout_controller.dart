import 'package:get/get.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/address/address_data.dart';
import 'package:qaisystore/data/datasource/remote/orders/cheackoutdata.dart';
import 'package:qaisystore/data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  CheackOutDataRemote cheackOutDataRemote =
      Get.put(CheackOutDataRemote(Get.find()));
  AddressDataRemote addressDataRemote = Get.put(AddressDataRemote(Get.find()));

  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressId = "0";

  late String priceorder;
  late String couponid;
  late String coupondiscuont;
  List<AddressModel> addressdata = [];

  chackout() async {
    if (paymentMethod == null) {
      return Get.snackbar("142".tr, "143".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("142".tr, "144".tr);
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressId.toString(),
      "ordertype": deliveryType.toString(),
      "pricedelivery": "10.5",
      "cuoponid": couponid.toString(),
      "cuopondiscuont": coupondiscuont.toString(),
      "orderprice": priceorder,
      "orderpaymentmethod": paymentMethod.toString()
    };
    var response = await cheackOutDataRemote.cheackoutData(data);

    statusRequest = handlingData(response);
    print("==============$response==========");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.homepage);
        Get.snackbar("Success", "Order was Successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("142".tr, "145".tr);
      }
    }
    update();
  }

  getShippngaddress() async {
    addressdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressDataRemote.viewaddressData(
      myServices.sharedPreferences.getString("id"),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        addressdata.addAll(dataresponse.map((e) => AddressModel.fromJson(e)));
        addressId = addressdata[0].addrssid;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    if (val == "0") addressId = "0";
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;

    update();
  }

  @override
  void onInit() {
    getShippngaddress();
    paymentMethod;
    deliveryType;
    // addressId;
    priceorder = Get.arguments["priceorder"].toString();
    couponid = Get.arguments["couponid"].toString();
    coupondiscuont = Get.arguments["coupondiscuont"].toString();

    super.onInit();
  }
}
