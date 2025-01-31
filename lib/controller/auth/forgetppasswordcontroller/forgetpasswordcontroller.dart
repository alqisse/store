import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/data/datasource/remote/auth/forgetpassword/checkemaildata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailDataRemote checkEmailDataRemote = CheckEmailDataRemote(Get.find());
  late TextEditingController email;

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstateforget = GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  checkemail() async {
    if (formstateforget.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailDataRemote.postData(email.text);
      print("=================== controller  $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "warrning", middleText: " Email Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
