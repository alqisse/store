import 'package:get/get.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class CustomListItemsCart extends StatelessWidget {
  final String title;
  final String subtitlePrice;
  final String imageurl;
  final String itemCount;
  final ItemsModel itemsModel;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomListItemsCart(
      {super.key,
      required this.title,
      required this.subtitlePrice,
      required this.imageurl,
      required this.itemCount,
      this.onAdd,
      this.onRemove,
      required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.itemsdetails,
            arguments: {"itemsdetalis": itemsModel});
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagestItems}/$imageurl",
                  width: 200,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitlePrice,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 3,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: AppColors.grey.withOpacity(0.2),
                        // padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(top: 5),
                        width: Get.width / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.ltr,
                          children: [
                            Container(
                              height: 37,
                              // width: 60,
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                  onPressed: onRemove,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: AppColors.black,
                                  )),
                            ),
                            Container(
                              // width: 50,
                              height: 38.3,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                itemCount,
                                style: const TextStyle(
                                    fontSize: 20,
                                    height: 1.1,
                                    fontFamily: 'sans'),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              // width: 60,
                              child: IconButton(
                                  onPressed: onAdd,
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
