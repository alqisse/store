import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/favorite/favoritedata.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  addfavorite(String itemsid);
  removefavorite(String itemsid);
  setfavorite(id, val);
}

class FavoriteControllerImp extends GetxController {
  FavoriteDataRemote favoriteDataRemote = FavoriteDataRemote(Get.find());

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  Map isfavorite = {};

  setfavorite(id, val) {
    // isfavorite[id];
    isfavorite[id] = val;
    print(isfavorite);
    update();
  }

  addfavorite(itemsid) async {
    print(
        "===============${myServices.sharedPreferences.getString("id")}======================================");
    var response = await favoriteDataRemote.addData(
        myServices.sharedPreferences.getString("id"), itemsid);
    print("================================= Controller $response");

    if (response['status'] == "success") {
      Get.rawSnackbar(message: "104".tr);
    }
    update();
  }

  removefavorite(String itemsid) async {
    var response = await favoriteDataRemote.removeData(
        myServices.sharedPreferences.getString("id"), itemsid);
    //  statusRequest = handlingData(response);

    if (response['status'] == "success") {
      Get.rawSnackbar(message: "146".tr);
    }
    update();
  }
}
