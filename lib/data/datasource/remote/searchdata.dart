import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class SearchDataRemote {
  Crud crud;
  SearchDataRemote(this.crud);

  searchData(search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
