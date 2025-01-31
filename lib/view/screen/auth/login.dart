import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:qaisystore/controller/auth/logincontroller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/double_back_to_close_snackbar.dart';
import 'package:qaisystore/core/funcations/validinput.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtformauth.dart';
import 'package:qaisystore/view/widget/auth/logoauth.dart';
import 'package:qaisystore/view/widget/auth/txtsingnup.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());

    return Scaffold(
      body: DoubleBackToCloseApp(
          snackBar: doubleBackToCloseSnackBar(),
          child: GetBuilder<LogInControllerImp>(
            builder: ((controller) => HandlingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Form(
                      key: controller.formstatelogin,
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(
                            text: "10".tr,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextBodyAuth(
                            text: "11".tr,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const LogoAuth(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAuth(
                            mycontroller: controller.email,
                            hinttext: "12".tr,
                            labeltext: "18".tr,
                            iconData: Icons.email_outlined,
                            obscureText: null,
                            valid: (val) {
                              return validInput(val!, 50, 6, "email");
                            },
                            isNumber: false,
                          ),
                          GetBuilder<LogInControllerImp>(
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
                          InkWell(
                              onTap: (() {
                                controller.goToForgetPassword();
                              }),
                              child: Text(
                                "14".tr,
                                style: const TextStyle(color: AppColors.blue),
                                // textAlign: TextAlign.end,
                              )),
                          CustomButtonAuth(
                            textbutton: "9".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextSinUpandSinIn(
                            textOne: "16".tr,
                            textTow: "17".tr,
                            onTap: () {
                              controller.goTosignup();
                            },
                          )
                        ],
                      ),
                    )))),
          )),
    );
  }
}
