import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:get/get.dart';
import 'package:qaisystore/data/datasource/remote/notificationdata.dart';
import 'package:qaisystore/data/model/notificationmodel.dart';

class NotificationController extends GetxController {
  NotificationDataRemote notificationDataRemote =
      NotificationDataRemote(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationModel> data = [];

  getNotification() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationDataRemote
        .getNotificationData(myServices.sharedPreferences.getString("id")!);
    print("================================= Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
