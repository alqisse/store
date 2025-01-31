import 'package:qaisystore/controller/onboarding_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: ((value) {
          controller.onPageChanged(value);
        }),
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    onBoardingList[index].image!,
                    //  width: 200,
                    height: Get.width / 1.2,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  onBoardingList[index].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[index].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 2,
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
