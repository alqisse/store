import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qaisystore/core/class/statusrequest.dart';
import 'package:get/get.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/handlinfdatacontroller.dart';
import 'package:qaisystore/data/datasource/remote/orders/detalisdata.dart';
import 'package:qaisystore/data/model/oderdetalismodel.dart';
import 'package:qaisystore/data/model/ordersmodel.dart';

class OrderDetalisController extends GetxController {
  late StatusRequest statusRequest;
  OrderDetalisDataRemote orderDetalisDataRemote =
      OrderDetalisDataRemote(Get.find());
  List<OrderDetalisModel> data = [];
  late OrdersModel orderdata;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];
  CameraPosition? kGooglePlex;

  Position? postion;

  double? lat;
  double? long;

  getOrdersDetalis() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetalisDataRemote
        .detalisOrdersData(orderdata.ordersId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => OrderDetalisModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addMarkers() {
    markers.add(
        Marker(markerId: const MarkerId("1"), position: LatLng(lat!, long!)));

    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 16.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    orderdata = Get.arguments['orderslist'];
    lat = double.parse(orderdata.addressLat!);
    long = double.parse(orderdata.addressLang!);
    addMarkers();
    getCurrentLocation();
    getOrdersDetalis();

    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
