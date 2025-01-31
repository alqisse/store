import 'package:qaisystore/core/constant/apptheme.dart';
import 'package:qaisystore/core/funcations/fcmconfige.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData apptheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);

    myServices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
    update();
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("46".tr, "137".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("46".tr, "138".tr);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("46".tr, "139".tr);
    }
  }

  @override
  void onInit() {
    // myServices.sharedPreferences.setString("step", "0");
    requestPerLocation();
    requestPermissionNotification();
    fcmconfig();
    String? sharedprefLang = myServices.sharedPreferences.getString("lang");

    if (sharedprefLang == "ar") {
      language = const Locale("ar");
      apptheme = themeArabic;
    } else if (sharedprefLang == "en") {
      language = const Locale("en");
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish;
    }

    super.onInit();
  }
}
