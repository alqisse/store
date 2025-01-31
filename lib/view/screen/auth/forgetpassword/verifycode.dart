import 'package:qaisystore/controller/auth/forgetppasswordcontroller/verifycode_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "50".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: ((controller) => HandlingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitleAuth(text: "51".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextBodyAuth(text: "52".tr),
                        const SizedBox(
                          height: 35,
                        ),
                        OtpTextField(
                          borderRadius: BorderRadius.circular(20),
                          fieldWidth: 50.0,
                          numberOfFields: 5,
                          borderColor: AppColors.primaryColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            Get.offNamed(
                                controller.checkCode(verificationCode));
                          }, // end onSubmit
                        ),
                      ],
                    )),
              )),
        ));
  }
}
