import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:qaisystore/core/localization/changelocallangcontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:get/get.dart';

class SetteingsPageController extends GetxController {
  MyServices myServices = Get.find();

  LocaleController localeController = Get.find();
  late bool valueNotifi;
  changeLang(String langcode) {
    myServices.sharedPreferences.setString("lang", langcode);
    localeController.changeLang(langcode);
    Get.back();

    update();
  }

  muteNotifications(bool value) {
    myServices.sharedPreferences.setBool("mutenotifi", value);
    valueNotifi = myServices.sharedPreferences.getBool("mutenotifi")!;
    update();
    String userid = myServices.sharedPreferences.getString("id")!;
    if (value && !valueNotifi) {
      FirebaseMessaging.instance.subscribeToTopic("user");
      FirebaseMessaging.instance.subscribeToTopic("user$userid");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("user");
      FirebaseMessaging.instance.unsubscribeFromTopic("user$userid");
    }
  }

  @override
  void onInit() {
    valueNotifi = myServices.sharedPreferences.getBool("mutenotifi")!;
    super.onInit();
  }
}
