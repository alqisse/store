import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class ArchiveDataRemote {
  Crud crud;
  ArchiveDataRemote(this.crud);

  archiveOrdersData(String? usersid) async {
    var response =
        await crud.postData(AppLink.ordersarchive, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  ordersRatingData(String? orderid, String? rating, String? comment) async {
    var response = await crud.postData(AppLink.ordersrating, {
      "orderid": orderid,
      "orderrating": rating,
      "ordercoment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
