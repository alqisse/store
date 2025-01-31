import 'package:get/get.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/offersdata.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';

class OffersController extends GetxController {
  OffersDataRemote offersDataRemote = OffersDataRemote(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> data = [];

  getOffers() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersDataRemote.offersData(
      myServices.sharedPreferences.getString("id"),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }
}
