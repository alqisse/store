import 'package:flutter/material.dart';
import 'package:qaisystore/controller/favorite_controller.dart';
import 'package:qaisystore/controller/offers_controller.dart';
import 'package:get/get.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/view/widget/offers/customlistitemsoffers.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    //  ItemsModel itemsModel = ItemsModel();
    return Scaffold(
        appBar: AppBar(
          title: Text("136".tr),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<OffersController>(
                builder: ((controller) => ListView(
                      children: [
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            children: [
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.data.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7),
                                  itemBuilder: (BuildContext context, index) {
                                    // favoriteController.isfavorite.clear();
                                    favoriteController.isfavorite[controller
                                            .data[index].itemsId
                                            .toString()] =
                                        controller.data[index].favorite
                                            .toString();
                                    print("${favoriteController.isfavorite}");
                                    return CustomListItemsOffers(
                                        itemsModel: controller.data[index]);
                                  }),
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
