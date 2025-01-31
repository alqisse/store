import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaisystore/core/constant/colors.dart';

MyServices myServices = Get.find();
// BuildContext? context;
dialogAddressAdd(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      message: const Text(
        "You Not hav deliveryaddress are you want add address",
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.blue),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Get.toNamed(AppRoute.addressview);
          },
          child: const Text(
            "Add",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text("cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
