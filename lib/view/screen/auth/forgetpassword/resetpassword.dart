import 'package:qaisystore/controller/auth/forgetppasswordcontroller/resetpassword_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/validinput.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtformauth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "39".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: ((controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Form(
                        key: controller.formstaterest,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextTitleAuth(
                              text: "35".tr,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(
                              text: "34".tr,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            GetBuilder<ResetPasswordControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                mycontroller: controller.password,
                                hinttext: "35".tr,
                                labeltext: "19".tr,
                                iconData: Icons.lock_outline,
                                valid: (val) {
                                  return validInput(val!, 20, 6, "password");
                                },
                                onTapIcon: () {
                                  controller.showpassword();
                                },
                                obscureText: controller.isshowpassword,
                                isNumber: false,
                              ),
                            ),
                            GetBuilder<ResetPasswordControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                mycontroller: controller.repassword,
                                hinttext: "35".tr,
                                labeltext: "19".tr,
                                iconData: Icons.lock_outline,
                                valid: (val) {
                                  return validInput(val!, 20, 6, "password");
                                },
                                onTapIcon: () {
                                  controller.showpassword();
                                },
                                obscureText: controller.isshowpassword,
                                isNumber: false,
                              ),
                            ),
                            CustomButtonAuth(
                              textbutton: "33".tr,
                              onPressed: () {
                                controller.resetPassword();
                              },
                            ),
                          ],
                        ),
                      )),
                ))));
  }
}
