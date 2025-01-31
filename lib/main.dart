import 'package:qaisystore/bindings/initialbinding.dart';
import 'package:qaisystore/core/localization/changelocallangcontroller.dart';
import 'package:qaisystore/core/localization/translation.dart';
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/routse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Trust Store',
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme,
      initialBinding: InitialBinding(),
      // routes:routes,
      getPages: routes,
    );
  }
}
