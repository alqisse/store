import 'package:flutter/material.dart';
import 'package:qaisystore/controller/orders/pending_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardPendingOrdes extends GetView<PendingController> {
  final OrdersModel listorders;
  const CardPendingOrdes({
    Key? key,
    required this.listorders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${"105".tr}${listorders.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(listorders.ordesDate!).fromNow(),
                  // "${listorders.ordesDate}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                )
              ],
            ),
            const Divider(),
            Text(
                "${"95".tr}${controller.printOrdertype(listorders.ordersType.toString())}"),
            Text("${"96".tr} ${listorders.ordersPrice} \$"),
            Text("${"97".tr} ${listorders.ordersPricedelivery} \$"),
            Text(
                "${"99".tr} ${controller.printpaymentmethod(listorders.ordersPaymentmethod.toString())}"),
            Text(
                "${"98".tr}${controller.printOrderStatus(listorders.ordersStatus.toString())}"),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${"100".tr} ${listorders.ordersTotleprice} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor)),
                if (listorders.ordersStatus == 0)
                  IconButton(
                    onPressed: () {
                      controller.deleteOrders(listorders.ordersId.toString());
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.red,
                      size: 35,
                    ),
                  ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.detalisorders, arguments: {
                      "orderslist": listorders,
                    });
                  },
                  color: AppColors.primaryColor,
                  child: Text("106".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.cardColor)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
