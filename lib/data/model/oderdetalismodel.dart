class OrderDetalisModel {
  String? totaleprice;
  int? totalecount;
  int? cartId;
  int? cartUsersid;
  int? cartItmesid;
  int? cartOrders;
  String? cartItmesPrice;
  int? itmesId;
  String? itmesName;
  String? itmesNameAr;
  String? itmesDesc;
  String? itmesDescAr;
  String? itmesImage;
  int? itmesCount;
  int? itmesPrice;
  int? itmesActive;
  int? itmesDiscount;
  String? itmesDate;
  int? itmesCateg;

  OrderDetalisModel(
      {this.totaleprice,
      this.totalecount,
      this.cartId,
      this.cartUsersid,
      this.cartItmesid,
      this.cartOrders,
      this.cartItmesPrice,
      this.itmesId,
      this.itmesName,
      this.itmesNameAr,
      this.itmesDesc,
      this.itmesDescAr,
      this.itmesImage,
      this.itmesCount,
      this.itmesPrice,
      this.itmesActive,
      this.itmesDiscount,
      this.itmesDate,
      this.itmesCateg});

  OrderDetalisModel.fromJson(Map<String, dynamic> json) {
    totaleprice = json['totaleprice'].toString();
    totalecount = json['totalecount'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItmesid = json['cart_itmesid'];
    cartOrders = json['cart_orders'];
    cartItmesPrice = json['cartitemprice'].toString();
    itmesId = json['itmes_id'];
    itmesName = json['itmes_name'];
    itmesNameAr = json['itmes_name_ar'];
    itmesDesc = json['itmes_desc'];
    itmesDescAr = json['itmes_desc_ar'];
    itmesImage = json['itmes_image'];
    itmesCount = json['itmes_count'];
    itmesPrice = json['itmes_price'];
    itmesActive = json['itmes_active'];
    itmesDiscount = json['itmes_discount'];
    itmesDate = json['itmes_date'];
    itmesCateg = json['itmes_categ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totaleprice'] = totaleprice;
    data['totalecount'] = totalecount;
    data['cart_id'] = cartId;
    data['cart_usersid'] = cartUsersid;
    data['cart_itmesid'] = cartItmesid;
    data['cart_orders'] = cartOrders;
    data['itmes_id'] = itmesId;
    data['itmes_name'] = itmesName;
    data['itmes_name_ar'] = itmesNameAr;
    data['itmes_desc'] = itmesDesc;
    data['itmes_desc_ar'] = itmesDescAr;
    data['itmes_image'] = itmesImage;
    data['itmes_count'] = itmesCount;
    data['itmes_price'] = itmesPrice;
    data['itmes_active'] = itmesActive;
    data['itmes_discount'] = itmesDiscount;
    data['itmes_date'] = itmesDate;
    data['itmes_categ'] = itmesCateg;
    return data;
  }
}
