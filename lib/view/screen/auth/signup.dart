import 'package:qaisystore/controller/auth/signupcontroller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/funcations/validinput.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtformauth.dart';

import 'package:qaisystore/view/widget/auth/txtsingnup.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Form(
                    key: controller.formstatesignup,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitleAuth(
                          text: "17".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextBodyAuth(
                          text: "24".tr,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        CustomTextFormAuth(
                          mycontroller: controller.username,
                          hinttext: "23".tr,
                          labeltext: "20".tr,
                          iconData: Icons.person_outline,
                          obscureText: null,
                          valid: (val) {
                            return validInput(val!, 15, 4, "username");
                          },
                          isNumber: false,
                        ),
                        CustomTextFormAuth(
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          labeltext: "18".tr,
                          iconData: Icons.email_outlined,
                          obscureText: null,
                          valid: ((val) {
                            return validInput(val!, 50, 6, "email");
                          }),
                          isNumber: false,
                        ),
                        CustomTextFormAuth(
                          mycontroller: controller.phone,
                          hinttext: "22".tr,
                          labeltext: "21".tr,
                          iconData: Icons.phone_android_outlined,
                          valid: (val) {
                            return validInput(val!, 12, 9, "phone");
                          },
                          onTapIcon: () {},
                          isNumber: true,
                        ),
                        GetBuilder<SignUpControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            mycontroller: controller.password,
                            hinttext: "13".tr,
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
                          textbutton: "17".tr,
                          onPressed: () {
                            controller.signup();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextSinUpandSinIn(
                          textOne: "25".tr,
                          textTow: "9".tr,
                          onTap: () {
                            controller.goTologin();
                          },
                        )
                      ],
                    ),
                  )))),
    );
  }
}
