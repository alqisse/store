
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
