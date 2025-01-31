import 'package:qaisystore/controller/itemsdetalis_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/view/widget/itemsdetalis/top_pageitemsdetalis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetalis extends StatelessWidget {
  const ItemsDetalis({super.key});

  @override
  Widget build(BuildContext context) {
    // ItemsDetalisController controller =
    Get.put(ItemsDetalisController());
    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: 50,
          child: MaterialButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Get.offNamed(AppRoute.cart);
              },
              child: Text(
                "76".tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))),
      body: GetBuilder<ItemsDetalisController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                TopPageItemsDetalis(
                  price: "\$${controller.itemsModel.itemsPrice!}",
                  count: "${controller.itemsCount}",
                  onAdd: () {
                    controller.addToCart();
                  },
                  onRemove: () {
                    controller.deleteFromCart();
                  },
                ),

                const Divider(
                  thickness: 1.5,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "134".tr,
                        style: Theme.of(context).textTheme.displayLarge!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${translationDatabase(controller.itemsModel.itemsDescAr!, controller.itemsModel.itemsDesc!)}  ddnnznnnkzzhhsjjjjksytgv b ddnnznnnkzzhhsjjjjksytgv ddnnznnnkzzhhsjjjjksytgv ddnnznnnkzzhhsjjjjksytgv",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      //   Text("الون",
                      // style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColors.fourthColor),
                      // ),
                    ],
                  ),
                ),
                // const SubitemsList()
              ],
            )),
      ),
    );
  }
}
