import 'package:qaisystore/controller/home/homescreen_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/view/widget/home/custombuttonbutoomappbar.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class CustomButtomAppBar extends StatelessWidget {
  const CustomButtomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => BottomAppBar(
          clipBehavior: Clip.hardEdge,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 65,
            // margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Row(children: [
              ...List.generate(controller.listpage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonButomAppBar(
                        textbutton: "${controller.titlebuttomappbar[i]}".tr,
                        iconbutton: controller.iconbuttomappbar[i],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currntpage == i ? true : false,
                      );
              })
            ]),
          ))),
    );
  }
}
