// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/class/curd.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
