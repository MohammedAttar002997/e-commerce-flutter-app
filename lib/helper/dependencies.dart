import 'package:flutter_ecommerce_app_clean_code/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/data/api/api_client.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/auth_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(
    () => sharedPreferences,
  );
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  //repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(productRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
