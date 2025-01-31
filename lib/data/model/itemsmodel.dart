class ItemsModel {
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
  String?     categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsPriceDiscount ;  

  ItemsModel(
      {this.itemsId,
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
       this.itemsPriceDiscount , 
      this.categoriesId,
      this.categoriesName,
      this.categoriesNamaAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['itmes_id'].toString();
    itemsName = json['itmes_name'];
    itemsNameAr = json['itmes_name_ar'];
    itemsDesc = json['itmes_desc'];
    itemsDescAr = json['itmes_desc_ar'];
    itemsImage = json['itmes_image'];
    itemsCount = json['itmes_count'].toString();
    itemsActive = json['itmes_active'].toString();
    itemsPrice = json['itmes_price'].toString();
    itemsDiscount = json['itmes_discount'].toString();
    itemsDate = json['itmes_date'];
    itemsCat = json['itmes_categ'].toString();
    favorite = json['favorit'].toString();
    itemsPriceDiscount = json['itmespricediscount'].toString();
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesNamaAr = json['categories_nama_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    }
    
  
  // "itmes_id": 1,
  //     "itmes_name": "laptop Hp probook450 G3",
  //     "itmes_name_ar": "لاب توب اتش بي",
  //     "itmes_desc": "RAM 16,Hard ssd 256 core i5",
  //     "itmes_desc_ar": "ssd 256 رام 16 هارد ",
  //     "itmes_image": "laptop.png",
  //     "itmes_count": 10,
  //     "itmes_price": 230,
  //     "itmes_active": 0,
  //     "itmes_discount": 10,
  //     "itmes_date": "2023-03-26 11:36:57",
  //     "itmes_categ": 1

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_nama_ar'] = this.categoriesNamaAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
