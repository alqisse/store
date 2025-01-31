import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class CheckEmailDataRemote {
  Crud crud;
  CheckEmailDataRemote(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
