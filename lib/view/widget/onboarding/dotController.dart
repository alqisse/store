import 'package:qaisystore/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class CostomDotControllerOnBoarding extends StatelessWidget {
  const CostomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: ((controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 20),
                        duration: const Duration(milliseconds: 900),
                        width: controller.currentPage == index ? 20 : 5,
                        height: 18,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            // borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle),
                      ))
            ],
          )),
    );
  }
}
