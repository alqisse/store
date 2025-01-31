import 'package:qaisystore/controller/auth/forgetppasswordcontroller/forgetpasswordcontroller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "14".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Form(
                        key: controller.formstateforget,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextTitleAuth(
                              text: "27".tr,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(
                              text: "29".tr,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            CustomTextFormAuth(
                              mycontroller: controller.email,
                              hinttext: "12".tr,
                              labeltext: "18".tr,
                              iconData: Icons.email_outlined,
                              valid: (val) {
                                return validInput(val!, 50, 6, "email");
                              },
                              isNumber: false,
                            ),
                            CustomButtonAuth(
                              textbutton: "30".tr,
                              onPressed: () {
                                controller.checkemail();
                              },
                            ),
                          ],
                        ),
                      )),
                )));
  }
}
