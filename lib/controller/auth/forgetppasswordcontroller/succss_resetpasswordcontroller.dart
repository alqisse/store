// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/constant/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

abstract class SuccssResetPasswordController extends GetxController {
  goToLogin();
}

class SuccssResetPasswordControllerImp extends SuccssResetPasswordController {
  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }
}
