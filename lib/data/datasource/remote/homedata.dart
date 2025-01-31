import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class HomePageDataRemote {
  Crud crud;
  HomePageDataRemote(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
