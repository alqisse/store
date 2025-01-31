// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/cart/cart_data.dart';
import 'package:qaisystore/data/model/cartmodel.dart';
import 'package:qaisystore/data/model/cuoponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late CartModel cartModel;

  CouponModel? couponModel;
  TextEditingController? textEditingCoupon;
  CartDataRemote cartDataRemote = CartDataRemote(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> dataCart = [];
  double totaleAllPrice = 0.0;
  int totaleAllitems = 0;
  int? discountcoupon = 0;
  String? couponName;
  String? couponid = "0";

  initialData() async {
    viewItems();
    update();
  }

  goTopagecheackout() {
    if (dataCart.isEmpty) {
      return Get.snackbar("46".tr, "135".tr);
    } else {
      Get.offNamed(AppRoute.checkout, arguments: {
        "priceorder": totaleAllPrice,
        "couponid": couponid,
        "coupondiscuont": discountcoupon,
        // "itemscart": cartModel
      });
    }
  }

  viewItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDataRemote.viewItemsData(
      myServices.sharedPreferences.getString("id"),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['datacart'];
        Map totalePriceCount = response['totalpricecount'];
        dataCart.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totaleAllPrice =
            double.parse(totalePriceCount['totale_allprice'].toString());
        totaleAllitems =
            int.parse(totalePriceCount['totale_allitems'].toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addItems(String itemsid, String itemsprice, String itemdicount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDataRemote.addData(
        myServices.sharedPreferences.getString("id"),
        itemsid,
        itemsprice,
        itemdicount);
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

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDataRemote.checkCoupon(textEditingCoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        discountcoupon = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        discountcoupon = 0;
        couponName = null;
        couponid = null;
        Get.snackbar("46".tr, "123".tr);
      }
    }
    update();
  }

  getTotalprice() {
    return totaleAllPrice - totaleAllPrice * discountcoupon! / 100;
  }

  resetVarCart() {
    totaleAllPrice = 0.0;
    totaleAllitems = 0;
    dataCart.clear();
  }

  refreshPage() {
    resetVarCart();
    viewItems();
  }

  @override
  void onInit() {
    textEditingCoupon = TextEditingController();
    initialData();
    super.onInit();
  }
}
