import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class FavoriteDataRemote {
  Crud crud;
  FavoriteDataRemote(this.crud);

  addData(String? usersid, String? itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String? usersid, String? itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
