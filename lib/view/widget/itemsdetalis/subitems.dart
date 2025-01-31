import 'package:qaisystore/controller/itemsdetalis_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubitemsList extends GetView<ItemsDetalisController> {
  const SubitemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColors.fourthColor
                    : Colors.white,
                border: Border.all(color: AppColors.fourthColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColors.fourthColor,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
