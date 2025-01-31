class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
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
  String? usersId;
  String? itemsPriceDiscount;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
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
      this.itemsCat,
      this.usersId,
      this.itemsPriceDiscount
      });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'].toString();
    favoriteUsersid = json['favorite_usersid'].toString();
    favoriteItemsid = json['favorite_itemsid'].toString();
    itemsId = json['itmes_id'].toString();
    itemsName = json['itmes_name'];
    itemsNameAr = json['itmes_name_ar'];
    itemsDesc = json['itmes_desc'];
    itemsDescAr = json['itmes_desc_ar'];
    itemsImage = json['itmes_image'];
    itemsCount = json['itmes_count'].toString();
     itemsPriceDiscount = json['itmespricediscount'].toString();
    itemsActive = json['itmes_active'].toString();
    itemsPrice = json['itmes_price'].toString();
    itemsDiscount = json['itmes_discount'].toString();
    itemsDate = json['itmes_date'];
    itemsCat = json['itmes_cat'].toString();
    usersId = json['users_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['items_id'] = this.itemsId;
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
    data['users_id'] = this.usersId;
    return data;
  }
}