// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:qaisystore/core/services/services.dart';

translationDatabase(String ar, String en) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
