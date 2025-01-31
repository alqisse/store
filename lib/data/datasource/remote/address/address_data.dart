import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class AddressDataRemote {
  Crud crud;
  AddressDataRemote(this.crud);

  addData(Map data) async {
    var response = await crud.postData(AppLink.addressAdd, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String? addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  getCountItemsData(String? usersid, String? itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewaddressData(String? usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  // checkCoupon(String couponName) async {
  //   var response =
  //       await crud.postData(AppLink.cheackcoupon, {"couponname": couponName});
  //   return response.fold((l) => l, (r) => r);
  // }
}
