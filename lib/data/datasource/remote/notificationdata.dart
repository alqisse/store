import 'package:qaisystore/core/class/curd.dart';
import 'package:qaisystore/linkapi.dart';

class NotificationDataRemote {
  Crud crud;
  NotificationDataRemote(this.crud);

  getNotificationData(String userid) async {
    var response =
        await crud.postData(AppLink.notifications, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
