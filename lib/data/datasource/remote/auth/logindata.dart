import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class LoginDataRemote {
  Crud crud;
  LoginDataRemote(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
