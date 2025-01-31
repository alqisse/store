import 'package:qaisystore/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaisystore/data/datasource/static/static.dart';
import '../../../core/constant/colors.dart';

class CostomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CostomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) =>
            controller.currentPage == onBoardingList.length - 1
                ? Container(
                    margin: EdgeInsets.only(
                        right: controller.lang == 'ar' ? Get.width / 1.3 : 0,
                        left: controller.lang == 'en' ? Get.width / 1.3 : 0),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      onPressed: () {
                        controller.next();
                      },
                      child: Text(
                        "8".tr,
                        style: const TextStyle(
                            height: 1.5, fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(
                        right: controller.lang == 'ar' ? Get.width / 1.3 : 0,
                        left: controller.lang == 'en' ? Get.width / 1.3 : 0),
                    width: 90,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        controller.skip();
                      },
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "133".tr,
                          style: const TextStyle(
                            height: 1,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          size: 20,
                          controller.lang == 'ar'
                              ? Icons.arrow_back_ios_new
                              : Icons.arrow_forward_ios,
                          color: AppColors.blue,
                        )
                      ]),
                    )));
  }
}
