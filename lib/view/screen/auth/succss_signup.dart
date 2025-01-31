import 'package:qaisystore/controller/auth/succss_signup_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/view/widget/auth/cuatomtxttitleauth.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtbodyauth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SuccssSignUp extends StatelessWidget {
  const SuccssSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccssSignUpControllerImp controller = Get.put(SuccssSignUpControllerImp());
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                  CustomTextTitleAuth(text: "38".tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextBodyAuth(
                    text: "28".tr,
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
              )),
        ));
  }
}
