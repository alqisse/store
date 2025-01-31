import 'package:flutter/material.dart';
import 'package:qaisystore/controller/orders/archive_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:qaisystore/view/widget/order/customcardarchive.dart';

class ArchiveOrdersPage extends StatelessWidget {
  const ArchiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text("108".tr),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<ArchiveController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: RefreshIndicator(
                      color: AppColors.thirdColor,
                      onRefresh: () async {
                        controller.data.clear();
                        await controller.refershOrders();
                      },
                      child: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) => CardArchiveOrders(
                              listorders: controller.data[index])),
                    ),
                  ))),
    );
  }
}
