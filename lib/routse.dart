import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/middelwhere/mymiddelwhere.dart';
import 'package:qaisystore/view/screen/address/add.dart';
import 'package:qaisystore/view/screen/address/adddetails.dart';
import 'package:qaisystore/view/screen/address/view.dart';
import 'package:qaisystore/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:qaisystore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:qaisystore/view/screen/auth/forgetpassword/succss_resetpassword.dart';
import 'package:qaisystore/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:qaisystore/view/screen/auth/login.dart';
import 'package:qaisystore/view/screen/auth/signup.dart';
import 'package:qaisystore/view/screen/auth/succss_signup.dart';
import 'package:qaisystore/view/screen/auth/verifycodesignup.dart';
import 'package:qaisystore/view/screen/cart.dart';
import 'package:qaisystore/view/screen/checkout.dart';
import 'package:qaisystore/view/screen/home/home_screen.dart';
import 'package:qaisystore/view/screen/items.dart';
import 'package:qaisystore/view/screen/itemsdetlise.dart';
import 'package:qaisystore/view/screen/language.dart';
import 'package:qaisystore/view/screen/notification.dart';
import 'package:qaisystore/view/screen/orders/archive.dart';
import 'package:qaisystore/view/screen/orders/detalis.dart';
import 'package:qaisystore/view/screen/orders/pending.dart';
import 'package:qaisystore/view/screen/paypalpage.dart';
import 'package:qaisystore/view/screen/myfavorite.dart';
import 'package:qaisystore/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccssResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccssSignUp()),
  //onboarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  // Home
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  // GetPage(name:AppRoute.homepage ,page:()=>const HomeScreen()),

  // Items
  GetPage(name: AppRoute.items, page: () => const ItemsPage()),
  GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetalis()),

  // favorite
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),

  //Cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  //Address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.paypalpage, page: () => const PayPalPage()),
  GetPage(name: AppRoute.notifications, page: () => const NotificationPage()),
  //Orders
  GetPage(name: AppRoute.pendingorders, page: () => const PendigOrdersPage()),
  GetPage(name: AppRoute.archiveorders, page: () => const ArchiveOrdersPage()),
  GetPage(name: AppRoute.detalisorders, page: () => const OrderDetalisPage()),
];
