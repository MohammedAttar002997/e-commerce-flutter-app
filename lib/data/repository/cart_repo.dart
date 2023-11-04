import 'dart:convert';

import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstant.CART_LIST);
    // sharedPreferences.remove(AppConstant.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];

    cartList.forEach(
      (element) {
        element.time = time;
        return cart.add(
          jsonEncode(element),
        );
      },
    );
    sharedPreferences.setStringList(AppConstant.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstant.CART_LIST));
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstant.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstant.CART_LIST)!;
      print("inside getCartList $carts");
    }
    List<CartModel> cartList = [];
    carts.forEach(
      (element) => cartList.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      ),
    );
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)) {
      // cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach(
      (element) => cartListHistory.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      ),
    );
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstant.CART_HISTORY_LIST, cartHistory);
    print("The length of history list is ${getCartHistoryList().length}");
    for (int j = 0; j < getCartHistoryList().length; j++) {
      print("The time for the order is ${getCartHistoryList()[j].time}");
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstant.CART_LIST);
  }
}
