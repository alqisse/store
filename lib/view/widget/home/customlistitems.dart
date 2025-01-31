import 'package:qaisystore/controller/home/homepage_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/imgaeasset.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class CustomListItemsHome extends GetView<HomePageControllerImp> {
  const CustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 10),
        // color: Colors.grey[300],

        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.itmes.length,
            itemBuilder: (BuildContext context, int index) {
              return Items(
                  itemsModel: ItemsModel.fromJson(controller.itmes[index]));
            }));
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.itemsdetails,
            arguments: {"itemsdetalis": itemsModel});
      },
      child: Card(
          child: Container(
        // height: 300,

        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Image.network(
                        "${AppLink.imagestItems}/${itemsModel.itemsImage}",
                        fit: BoxFit.fill,
                      ),
                      if (itemsModel.itemsDiscount != "0")
                        Positioned(
                            child: Image.asset(
                          AppImageAsset.saleOne,
                          width: 30,
                        ))
                    ],
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${translationDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!)}",
                        style: const TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${"84".tr} ${itemsModel.itemsDiscount}%",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: AppColors.red),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${"85".tr} 4.5",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color: AppColors.yellow,
                                  fontFamily: "sace"),
                            ),
                            const Spacer(),
                            Text(
                              "${itemsModel.itemsPrice}\$",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color: AppColors.yellow,
                                  fontFamily: "sace"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      )
          //  Stack(
          //           children: [
          //            Container(
          //             padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          //             margin:const EdgeInsets.symmetric(horizontal: 10),
          //             child: Image.network(
          //               "${AppLink.imagestItems}/${itemsModel.itemsImage}",
          //               width: 150,height:150,fit: BoxFit.fill,)),
          //           Container(
          //            height: 160,
          //            width: 200,
          //            decoration: BoxDecoration(
          //             color: AppColors.cardColor.withOpacity(0.1),
          //             borderRadius: BorderRadius.circular(20)

          //            ),
          //           ),
          //           Positioned(
          //             top: 0,
          //             left: 15,
          //             child:Container(
          //               child: Text("${translationDatabase(itemsModel.itemsNameAr!, itemsModel.itemsName!)}",
          //               style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          //             )
          //             )
          //           ],
          //           ),
          ),
    );
  }
}
