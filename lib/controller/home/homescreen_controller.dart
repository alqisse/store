// ignore: depend_on_referenced_packages
import 'package:qaisystore/core/services/services.dart';
import 'package:qaisystore/view/screen/home/homepage.dart';
import 'package:qaisystore/view/screen/myfavorite.dart';
import 'package:qaisystore/view/screen/offerspage.dart';

import 'package:qaisystore/view/screen/setteings.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

abstract class HomeSccreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeSccreenController {
  int currntpage = 0;

  MyServices myServices = Get.find();

  List<Widget> listpage = [
    const HomePage(),
    const MyFavorite(),
    const OffersPage(),
    const SetteingsPage()
  ];

  List titlebuttomappbar = ["80", "69", "82", "83"];
  List<IconData> iconbuttomappbar = [
    Icons.home,
    Icons.favorite_border_outlined,
    Icons.local_offer_outlined,
    Icons.settings
  ];

  @override
  changePage(int i) {
    currntpage = i;
    update();
  }
}
