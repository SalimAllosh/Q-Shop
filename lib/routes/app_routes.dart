import 'package:flutter/material.dart';
import 'package:shop_app/screens/animated_start_screen.dart';
import 'package:shop_app/screens/card_screen.dart';
import 'package:shop_app/screens/edit_and_add_product_screen.dart';
import 'package:shop_app/screens/edit_user_name_screen.dart';
import 'package:shop_app/screens/edit_user_personal_info_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/signin_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/user_information_screen.dart';
import '../screens/user_products_screen.dart';

class AppRoutes {
  static const String _productOverViewScreen = "/product_over_view_screen";
  static String getProductOverViewScreen() => _productOverViewScreen;

  static const String _productDetailesScreen = "/product_detailes_screen";
  static String getproductDetailesScreen() => _productDetailesScreen;

  static const String _cardScreen = "/card_screen";
  static String getCardScreen() => _cardScreen;

  static const String _orderScreen = "/order_screen";
  static String getOrdersScreen() => _orderScreen;

  static const String _userProductsScreen = "/user_products_screen";
  static String getuserProductsScreen() => _userProductsScreen;

  static const String _userAddAndEditProductsScreen =
      "/user_add_and_edit_products_screen";
  static String getuserAddAndEditProductsScreen() =>
      _userAddAndEditProductsScreen;

  static const String _animatedStartScreen = "/animated_start_screen";
  static String getAnimatedStartScreen() => _animatedStartScreen;

  static const String _splashScreen = "/splash_screen";
  static String getSplashScreen() => _splashScreen;

  static const String _signupScreen = "/signup_screen";
  static String getSignupScreen() => _signupScreen;

  static const String _signinScreen = "/signin_screen";
  static String getSigninScreen() => _signinScreen;

  static const String _userInformationScreen = "/user_Information_Screen";
  static String getUserInformationScreen() => _userInformationScreen;

  static const String _editUserNameScreen = "/_edit_user_name_screen";
  static String getEditUserNameScreenScreen() => _editUserNameScreen;

  static const String _editUserPersonalInfoScreen =
      "/_edit_user_personal_info_screen";
  static String getEditUserPersonalInfoScreen() => _editUserPersonalInfoScreen;

  static Map<String, Widget Function(BuildContext)> routes = {
    _animatedStartScreen: (ctx) => const AnimatedStartScreen(),
    _splashScreen: (ctx) => const SplashScreen(),
    _signupScreen: (ctx) => const SignupScreen(),
    _signinScreen: (ctx) => const SigninScreen(),
    _productOverViewScreen: (ctx) => const ProductsOverViewScreen(),
    _productDetailesScreen: (ctx) => const ProductDetailScreen(),
    _cardScreen: (ctx) => const CardScreen(),
    _orderScreen: (ctx) => const OrdersScreen(),
    _userProductsScreen: (ctx) => const UserProductsScreen(),
    _userAddAndEditProductsScreen: (ctx) => const UserEditAndAddProductScreen(),
    _userInformationScreen: (ctx) => const UserInformationScreen(),
    _editUserNameScreen: (ctx) => const EditUserNameScreen(),
    _editUserPersonalInfoScreen: (ctx) => const EditUserPersonalInfoScreen()
  };
}
