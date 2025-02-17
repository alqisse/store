import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class ResetPasswordDataRemote {
  Crud crud;
  ResetPasswordDataRemote(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
