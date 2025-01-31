// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/favorite/myfavorite_data.dart';
import 'package:qaisystore/data/model/myfavorite.dart';
import 'package:get/get.dart';

abstract class MyFavorite extends GetxController {
  initialData();
  deleteFavorite(String? favoid);
  getFavorite();
}

class MyFavoriteCoontrollerImp extends MyFavorite {
  MyFavoriteDataRemote myFavoriteDataRemote = MyFavoriteDataRemote(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<MyFavoriteModel> data = [];

  @override
  initialData() {
    getFavorite();
    update();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  getFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavoriteDataRemote
        .getData(myServices.sharedPreferences.getString("id"));
    print("================================= Controller $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  deleteFavorite(favoid) {
    myFavoriteDataRemote.deleteData(favoid);
    data.removeWhere((element) => element.favoriteId == favoid);
    Get.rawSnackbar(message: "146".tr);
    update();
  }
}
