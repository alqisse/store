import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goTologin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  bool isshowpassword = true;

  SignupDataRemote signupDataRemote = SignupDataRemote(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List data = [];

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();

  @override
  signup() async {
    if (formstatesignup.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupDataRemote.postData(
          username.text, password.text, email.text, phone.text);
      print("=================== controller  $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoute.successSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "141".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goTologin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
