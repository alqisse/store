import 'package:qaisystore/controller/favorite_controller.dart';
import 'package:qaisystore/controller/offers_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/imgaeasset.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const CustomListItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.itemsdetails,
            arguments: {"itemsdetalis": itemsModel});
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: itemsModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                      width: 150,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "${translationDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!)}",
                    style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  //  Text("${itemsModel.categoriesName} ",
                  //  style:const TextStyle(color: AppColors.grey,fontSize: 10,),textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${"70".tr}3.5",
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        height: 20,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            ...List.generate(5, (context) {
                              return const Icon(
                                Icons.star,
                                size: 14,
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                  //  const SizedBox(height: 20,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPrice}\$",
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteControllerImp>(
                        builder: ((controller) => IconButton(
                            onPressed: () {
                              if (controller.isfavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setfavorite(
                                    itemsModel.itemsId!, "0");

                                controller.removefavorite(itemsModel.itemsId!);
                              } else {
                                controller.setfavorite(
                                    itemsModel.itemsId!, "1");
                                controller.addfavorite(itemsModel.itemsId!);
                              }
                            },
                            icon: Icon(
                              controller.isfavorite[itemsModel.itemsId] == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColors.primaryColor,
                            ))),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                  child: Image.asset(
                AppImageAsset.saleOne,
                width: 40,
              ))
          ],
        ),
      ),
    );
  }
}
