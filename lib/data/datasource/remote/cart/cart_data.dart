import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class CartDataRemote {
  Crud crud;
  CartDataRemote(this.crud);

  addData(String? usersid, String? itemsid, String? itemsprice,
      String? itemsdicount) async {
    var response = await crud.postData(AppLink.cartadd, {
      "usersid": usersid,
      "itemsid": itemsid,
      "itemsprice": itemsprice,
      "itemsdicount": itemsdicount
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String? usersid, String? itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountItemsData(String? usersid, String? itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewItemsData(String? usersid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response =
        await crud.postData(AppLink.cheackcoupon, {"couponname": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
