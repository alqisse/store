import 'package:qaisystore/controller/cart_controller.dart';
import 'package:qaisystore/controller/home/homepage_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/view/widget/cart/buttom_navigbar.dart';
import 'package:qaisystore/view/widget/cart/customlist_itemscart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    HomePageControllerImp homePageController = Get.find();

    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottomNavgationBarCart(
            price: '${controller.totaleAllPrice}',
            shaping: '20.3',
            discount: controller.discountcoupon.toString(),
            totalPrice: '${controller.getTotalprice()}',
            onPressedButton: () {
              controller.goTopagecheackout();
            },
            controllercoupon: controller.textEditingCoupon!,
            onApplyCoupon: () {
              controller.checkCoupon();
            },
          ),
        ),
        appBar: AppBar(
          title: Text("64".tr),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              GetBuilder<CartController>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: Column(
                          children: [
                            ...List.generate(
                              controller.dataCart.length,
                              (index) => CustomListItemsCart(
                                itemsModel: ItemsModel.fromJson(
                                    homePageController.itmes[index]),
                                title:
                                    '${translationDatabase(controller.dataCart[index].itemsNameAr!, controller.dataCart[index].itemsName!)}',
                                subtitlePrice:
                                    '${controller.dataCart[index].totalePrice}\$',
                                imageurl:
                                    controller.dataCart[index].itemsImage!,
                                onAdd: () async {
                                  await controller.addItems(
                                    controller.dataCart[index].itemsId!,
                                    controller.dataCart[index].itemsPrice!,
                                    controller.dataCart[index].itemsDiscount!,
                                  );
                                  controller.refreshPage();
                                },
                                onRemove: () async {
                                  await controller.deleteItems(
                                      controller.dataCart[index].itemsId!);
                                  controller.refreshPage();
                                },
                                itemCount:
                                    '${controller.dataCart[index].totaleCount}',
                              ),
                            )
                          ],
                        ),
                      )),
            ],
          ),
        ));
  }
}
