import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class OffersDataRemote {
  Crud crud;
  OffersDataRemote(this.crud);

  offersData(String? usersid) async {
    var response = await crud.postData(AppLink.offers, {"userid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
