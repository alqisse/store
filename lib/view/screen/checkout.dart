import 'package:flutter/material.dart';
import 'package:qaisystore/controller/checkout_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/imgaeasset.dart';
import 'package:qaisystore/core/constant/routes.dart';

import 'package:qaisystore/view/widget/checkout/customdeliverytype.dart';
import 'package:qaisystore/view/widget/checkout/customshppingaddres.dart';
import 'package:qaisystore/view/widget/checkout/paymentmethode.dart';
import 'package:qaisystore/view/widget/checkout/title.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("92".tr),
        ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 7),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30)),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                if (controller.paymentMethod == "1") {
                  Get.toNamed(AppRoute.paypalpage);
                } else {
                  controller.chackout();
                }
              },
              textColor: Colors.white,
              child: Text("92".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            )),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GetBuilder<CheckoutController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: ListView(
                  children: [
                    CustomTitleCheckout(title: "91".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPaymentMethodeCheckout(
                          title: "89".tr,
                          onPressed: () {
                            controller.choosePaymentMethod("0");
                          },
                          isActive:
                              controller.paymentMethod == "0" ? true : false,
                        ),
                        CustomPaymentMethodeCheckout(
                          title: "90".tr,
                          onPressed: () {
                            controller.choosePaymentMethod("1");
                          },
                          isActive:
                              controller.paymentMethod == "1" ? true : false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTitleCheckout(title: "88".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1");
                            },
                            child: CustomDeliveryTypeCheckout(
                                imagename: AppImageAsset.deliveryImage2,
                                title: "87".tr,
                                isactiv: controller.deliveryType == "1"
                                    ? true
                                    : false)),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0");
                            },
                            child: CustomDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethruImage,
                                title: "86".tr,
                                isactiv: controller.deliveryType == "0"
                                    ? true
                                    : false)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.deliveryType == "1")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          controller.addressdata.isEmpty
                              ? Center(
                                  child: Text(
                                  "94".tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blue),
                                ))
                              : Column(
                                  children: [
                                    CustomTitleCheckout(title: "93".tr),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ...List.generate(
                                      controller.addressdata.length,
                                      (index) => InkWell(
                                        onTap: (() {
                                          controller.chooseShippingAddress(
                                              controller.addressdata[index]
                                                  .addrssid!);
                                        }),
                                        child: CustomShippingAddresCheckout(
                                            title: controller
                                                .addressdata[index].name!,
                                            body: controller
                                                .addressdata[index].street!,
                                            isactiv: controller.addressId ==
                                                    controller
                                                        .addressdata[index]
                                                        .addrssid!
                                                ? true
                                                : false),
                                      ),
                                    )
                                  ],
                                )
                        ],
                      )
                  ],
                ),
              ),
            )));
  }
}
