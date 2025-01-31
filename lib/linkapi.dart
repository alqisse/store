class AppLink {
//mamon14  172.17.115.113 mymodem 172.18.28.81
  static const String server = "https://qkshope.000webhostapp.com/ecommerce";

  // static const String imagestatic = "http://192.168.43.38/ecommerce/upload";
//emlut=> 10.0.2.2  , 192.168.43.38 الشبكه حق جوالي
//=======================================================
  // static const String server = "http://10.0.2.2//ecommerce";
  static const String imagestatic = "$server/upload";
//========================== Image ============================
  static const String imagestCategories = "$imagestatic/categories";
  static const String imagestItems = "$imagestatic/items";
// =============================================================
//
  static const String test = "$server/test.php";
  static const String notifications = "$server/notifications.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verifycodesignup.php";
  static const String resend = "$server/auth/resendverifycod.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletemyfavorite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcuont_items.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon

  static const String cheackcoupon = "$server/coupon/cheackcoupon.php";

  //cheackout\orders
  static const String cheackout = "$server/orders/cheackout.php";
  static const String orderspending = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetalis = "$server/orders/detalis.php";
  static const String ordersdelete = "$server/orders/delete.php";

  //Offers
  static const String offers = "$server/offers.php";

  //rating
  static const String ordersrating = "$server/rating/ratingorder.php";
}
