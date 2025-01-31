import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class OrderDetalisDataRemote {
  Crud crud;
  OrderDetalisDataRemote(this.crud);

  detalisOrdersData(String orderid) async {
    var response =
        await crud.postData(AppLink.ordersdetalis, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
