import 'package:qaisystore/controller/myfavorite_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/view/widget/favorite/customlist_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteCoontrollerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("69".tr),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              GetBuilder<MyFavoriteCoontrollerImp>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, index) {
                              return CustomListItemsFavorite(
                                  myFavoriteModel: controller.data[index]);
                            }),
                      ))
            ],
          ),
        ));
  }
}
