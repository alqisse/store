import 'package:qaisystore/controller/home/homepage_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:qaisystore/core/constant/imgaeasset.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
        builder: ((controller) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Container(
                    // alignment: Alignment.center,
                    height: 200,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(AppImageAsset.discountimage),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                      top: 10,
                      left: 20,
                      child: Container(
                        // height: 200,
                        width: Get.width / 2.5,
                        decoration: BoxDecoration(
                            color: AppColors.grey2.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.white)),
                            Text(body,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColors.yellow,
                                    fontWeight: FontWeight.bold)),
                          ],
                          // title: Text(title,
                          //     style: const TextStyle(
                          //         fontSize: 20, color: Colors.white)),
                          // subtitle: Text(body,
                          //     style: const TextStyle(
                          //         fontSize: 20,
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold)),
                        ),
                      ))
                ],
              ),
            )));
  }
}
