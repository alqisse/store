import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaisystore/controller/address/adddetails_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/view/widget/auth/custombtnauth.dart';
import 'package:qaisystore/view/widget/auth/customtxtformauth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AddAddressDetailsController controller =
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('132'.tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "128".tr,
                      labeltext: "128".tr,
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "129".tr,
                      labeltext: "129".tr,
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "130".tr,
                      labeltext: "130".tr,
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomButtonAuth(
                    textbutton: "131".tr,
                    onPressed: () {
                      controller.addAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
