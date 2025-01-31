import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class CheackOutDataRemote {
  Crud crud;
  CheackOutDataRemote(this.crud);

  cheackoutData(Map data) async {
    var response = await crud.postData(AppLink.cheackout, data);
    return response.fold((l) => l, (r) => r);
  }
}
