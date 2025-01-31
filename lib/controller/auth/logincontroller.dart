import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/data/datasource/remote/auth/logindata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();
  goTosignup();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  LoginDataRemote loginDataRemote = LoginDataRemote(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  login() async {
    if (formstatelogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginDataRemote.postData(
        email.text,
        password.text,
      );
      print("=================== controller  $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response['data']);
          if (response["data"]["users_approve"] == 1) {
            myServices.sharedPreferences
                .setString("id", response["data"]["users_id"].toString());
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response["data"]["users_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["users_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["users_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("user");
            FirebaseMessaging.instance.subscribeToTopic("user$userid");
            myServices.sharedPreferences.setBool("mutenotifi", true);

            Get.offAllNamed(AppRoute.homescreen);
          } else {
            Get.offNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(title: "46".tr, middleText: " 140".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goTosignup() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // print("======================${AppLink.server}=======================");
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
