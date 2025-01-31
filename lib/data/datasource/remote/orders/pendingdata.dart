import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class PendingDataRemote {
  Crud crud;
  PendingDataRemote(this.crud);

  pendingOrdersData(String? usersid) async {
    var response =
        await crud.postData(AppLink.orderspending, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrdersData(String? orderid) async {
    var response =
        await crud.postData(AppLink.ordersdelete, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
