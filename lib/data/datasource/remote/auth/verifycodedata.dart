import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class VerifyCodeSignupDataRemote {
  Crud crud;
  VerifyCodeSignupDataRemote(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodessignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
