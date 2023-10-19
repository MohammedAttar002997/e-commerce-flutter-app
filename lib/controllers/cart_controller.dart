import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartReop cartReop;

  CartController({
    required this.cartReop,
  });

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(productModel.id!)) {
      _items.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          price: value.price,
          name: value.name,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(productModel.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(productModel.id!, () {
          return CartModel(
            id: productModel.id,
            price: productModel.price,
            name: productModel.name,
            img: productModel.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar(
          "Item count $quantity",
          "You should at list add an item in the cart !",
          backgroundColor: AppColor.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
