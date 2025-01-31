import 'package:qaisystore/controller/favorite_controller.dart';
import 'package:qaisystore/controller/items_controller.dart';
import 'package:qaisystore/controller/myfavorite_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/myfavorite.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class CustomListItemsFavorite extends GetView<ItemsControllerImp> {
  final MyFavoriteModel myFavoriteModel;
  const CustomListItemsFavorite({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());

    return InkWell(
      onTap: () {
        // Get.toNamed(AppRoute.itemsdetails,arguments: {
        //   "itemsdetalis":itemsModel
        // });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagestItems}/${myFavoriteModel.itemsImage!}",
                width: 150,
                height: 70,
                fit: BoxFit.fill,
              ),
              Text(
                "${translationDatabase(myFavoriteModel.itemsNameAr!, myFavoriteModel.itemsName!)}",
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
                    "${myFavoriteModel.itemsPrice}\$",
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  GetBuilder<MyFavoriteCoontrollerImp>(
                    builder: ((controller) => IconButton(
                        onPressed: () {
                          controller.deleteFavorite(myFavoriteModel.favoriteId);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.primaryColor,
                        ))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
