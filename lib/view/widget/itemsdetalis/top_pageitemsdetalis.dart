import 'package:qaisystore/controller/itemsdetalis_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qaisystore/view/widget/itemsdetalis/countandpriceitems.dart';

class TopPageItemsDetalis extends GetView<ItemsDetalisController> {
  final String price;
  final String count;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const TopPageItemsDetalis({
    super.key,
    required this.price,
    required this.count,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: AppColors.grey.withOpacity(0.4)),
                      bottom:
                          BorderSide(color: AppColors.grey.withOpacity(0.4)),
                      right: BorderSide(color: AppColors.grey.withOpacity(0.4)),
                      left:
                          BorderSide(color: AppColors.grey.withOpacity(0.4)))),
              height: Get.width / 2,
              width: double.infinity,
              child: Hero(
                tag: controller.itemsModel.itemsId!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imagestItems}/${controller.itemsModel.itemsImage!}",
                  width: 200,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${translationDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}",
              style: Theme.of(context).textTheme.displayLarge!,
            ),
            const SizedBox(
              height: 20,
            ),
            CountAndPrice(
                price: price, count: count, onAdd: onAdd, onRemove: onRemove),
          ],
        ),
      ),
    ]);
  }
}
