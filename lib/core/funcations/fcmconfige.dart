import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:qaisystore/controller/orders/pending_controller.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print("$settings");
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("=============Notification================");
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        "${message.notification!.title}", "${message.notification!.body}");
    refreshorderNotifiy(message.data);
  });
}

refreshorderNotifiy(data) {
  if (data['pagename'] == 'refreshorders') {
    PendingController controller = Get.find();
    controller.refershOrders();
  }
}
