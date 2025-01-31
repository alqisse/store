import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/data/datasource/remote/auth/forgetpassword/resetpassworddata.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordDataRemote resetPasswordDataRemote =
      ResetPasswordDataRemote(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;

  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstaterest = GlobalKey<FormState>();
  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  resetPassword() async {
    if (formstaterest.currentState!.validate()) {
      if (password.text != repassword.text) {
        return Get.defaultDialog(
            title: "Error", middleText: "passwor Not Same");
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await resetPasswordDataRemote.postData(email!, password.text);
        print("=================== controller  $response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            //  data.addAll(response['data']);
            Get.offNamed(AppRoute.successResetpassword);
          } else {
            Get.defaultDialog(title: "warrning", middleText: "Try agin");
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
