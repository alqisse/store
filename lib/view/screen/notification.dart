import 'package:flutter/material.dart';
import 'package:qaisystore/controller/notification_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/sheard/customlist_tile.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // NotificationController controller =
    Get.put(NotificationController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "81".tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...List.generate(
                      controller.data.length,
                      (index) => Card(
                        child: Stack(
                          children: [
                            CustomListTaile(
                              title: controller.data[index].notificationTitle!,
                              subTitle:
                                  controller.data[index].notificationBody!,
                              leading: const CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  )),
                              trealingicon: Icons.delete,
                              coloricon: AppColors.red,
                            ),
                            Positioned(
                              right: 5,
                              top: 0,
                              child: Text(
                                Jiffy.parse(controller
                                        .data[index].notificationDate!)
                                    .fromNow(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
