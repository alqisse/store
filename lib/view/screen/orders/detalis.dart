import 'package:flutter/material.dart';
import 'package:qaisystore/controller/orders/ordersdetalis_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class OrderDetalisPage extends StatelessWidget {
  const OrderDetalisPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetalisController());
    return Scaffold(
      appBar: AppBar(
        title: Text("116".tr),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GetBuilder<OrderDetalisController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Table(children: [
                            TableRow(children: [
                              Text(
                                "117".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("119".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              Text("118".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold))
                            ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itmesName}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].totalecount}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].cartItmesPrice} \$",
                                  textAlign: TextAlign.center,
                                )
                              ]),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                                " ${"100".tr}${controller.orderdata.ordersTotleprice} \$",
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.orderdata.ordersType == 1)
                    Card(
                      child: ListTile(
                        title: Text("120".tr,
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${controller.orderdata.addressName}  ${controller.orderdata.addressStreet}"),
                      ),
                    ),
                  // ignore: unrelated_type_equality_checks
                  if (controller.orderdata.ordersType == 1)
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        height: 400,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          // onTap: (latLng) {
                          //   controller.addMarkers(latLng);
                          // },
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
