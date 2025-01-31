import 'package:qaisystore/controller/auth/forgetppasswordcontroller/succss_resetpasswordcontroller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SuccssResetPassword extends StatelessWidget {
  const SuccssResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccssResetPasswordControllerImp controller =
        Get.put(SuccssResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "32".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: SafeArea(
          child: Container(
              // padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 60),

              child: Expanded(
            flex: 2,
            child: Column(
              children: [
                const Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 170,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextTitleAuth(text: "37".tr),
                const SizedBox(
                  height: 15,
                ),
                CustomTextBodyAuth(
                  text: "36".tr,
                ),
                const Spacer(),
                CustomButtonAuth(
                    textbutton: "31".tr,
                    onPressed: () {
                      controller.goToLogin();
                    }),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          )),
        ));
  }
}
