class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddressid;
  int? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotleprice;
  int? ordersCuopon;
  String? ordersrating;
  String? orderscoment;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordesDate;
  int? ordersdelivery;
  int? addressId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;
  String? addressUsersid;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddressid,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotleprice,
      this.ordersCuopon,
      this.ordersrating,
      this.orderscoment,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordesDate,
      this.ordersdelivery,
      this.addressId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang,
      this.addressUsersid});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddressid = json['orders_addressid'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTotleprice = json['orders_totleprice'].toString();
    ordersCuopon = json['orders_cuopon'];
    ordersrating = json['orders_rating'].toString();
    orderscoment = json['orders_coment'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordesDate = json['ordes_date'];
    ordersdelivery = json['ordes_delivery'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toString();
    addressLang = json['address_lang'].toString();
    addressUsersid = json['address_usersid'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_addressid'] = ordersAddressid;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totleprice'] = ordersTotleprice;
    data['orders_cuopon'] = ordersCuopon;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['ordes_date'] = ordesDate;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    data['address_usersid'] = addressUsersid;
    return data;
  }
}
