import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class ItemsDataRemote {
  Crud crud;
  ItemsDataRemote(this.crud);

  getData(String? catid, String? usersid) async {
    var response = await crud
        .postData(AppLink.items, {"cateid": catid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
