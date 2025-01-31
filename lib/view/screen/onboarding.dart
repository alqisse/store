import 'package:qaisystore/controller/onboarding_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/view/widget/onboarding/customSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/dotController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    //حقن الصفحه بلكنترولر الخاص بها
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child:
                  CustomSliderOnBoarding() //import from widget folder onboarding
              ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CostomButtonOnBoarding(),
                  SizedBox(
                    height: 25,
                  ),
                  CostomDotControllerOnBoarding(),
                  //import from widget folder onboarding
                ],
              ))
        ],
      ),
    );
  }
}
