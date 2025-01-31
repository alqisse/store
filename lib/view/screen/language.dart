import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/localization/changelocallangcontroller.dart';
import 'package:qaisystore/view/widget/custombuttonlang.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(
          height: 20,
        ),
        CustomButtonLang(
          textbutton: "Ar",
          onPressed: () {
            localeController.changeLang("ar");
            Get.offAllNamed(AppRoute.onBoarding);
          },
        ),
        CustomButtonLang(
          textbutton: "En",
          onPressed: () {
            localeController.changeLang("en");
            Get.offAllNamed(AppRoute.onBoarding);
          },
        )
      ]),
    ));
  }
}
