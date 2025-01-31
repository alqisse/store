class CartModel {
  String? totalePrice;
  String? totaleCount;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;

  CartModel(
      {this.totalePrice,
      this.totaleCount,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    totalePrice = json['totaleprice'].toString();
    totaleCount = json['totalecount'].toString();
    cartId = json['cart_id'].toString();
    cartUsersid = json['cart_usersid'].toString();
    cartItemsid = json['cart_itemsid'].toString();
    itemsId = json['itmes_id'].toString();
    itemsName = json['itmes_name'].toString();
    itemsNameAr = json['itmes_name_ar'];
    itemsDesc = json['itmes_desc'];
    itemsDescAr = json['itmes_desc_ar'];
    itemsImage = json['itmes_image'];
    itemsCount = json['itmes_count'].toString();
    itemsActive = json['itmes_active'].toString();
    itemsPrice = json['itmes_price'].toString();
    itemsDiscount = json['itmes_discount'].toString();
    itemsDate = json['itmes_date'];
    itemsCat = json['itmes_cat'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totaleprice'] = this.totalePrice;
    data['totalecount'] = this.totaleCount;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itmesid'] = this.cartItemsid;
    data['itms_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
