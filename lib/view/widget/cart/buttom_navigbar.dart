import 'package:qaisystore/controller/cart_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaisystore/view/widget/cart/custombuttoncoupon.dart';

class CustomBottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String shaping;
  final String totalPrice;
  final TextEditingController controllercoupon;
  final void Function()? onPressedButton;
  final void Function()? onApplyCoupon;

  const CustomBottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.shaping,
      required this.totalPrice,
      this.onPressedButton,
      required this.controllercoupon,
      this.onApplyCoupon,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllercoupon,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                  hintText: "77".tr,
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.only(),
                                  // ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: CustomButtonCoupon(
                                textbutton: "79".tr, onPressed: onApplyCoupon),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                      "${"77".tr}:${controller.couponName!}",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ))),
          Container(
            // margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("65".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("\$$price",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("78".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("%$discount",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("66".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("\$$shaping",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("67".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 16)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("\$$totalPrice",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: onPressedButton,
            textColor: Colors.white,
            height: 55,
            color: AppColors.primaryColor,
            minWidth: double.infinity,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Text("68".tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
