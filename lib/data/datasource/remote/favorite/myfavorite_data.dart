import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class MyFavoriteDataRemote {
  Crud crud;
  MyFavoriteDataRemote(this.crud);

  getData(String? usersid) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String? favoriteid) async {
    var response = await crud
        .postData(AppLink.deletefromfavroite, {"favoriteid": favoriteid});
    return response.fold((l) => l, (r) => r);
  }
}
