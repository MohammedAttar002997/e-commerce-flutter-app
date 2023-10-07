import 'package:flutter_ecommerce_app_clean_code/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/data/api/api_client.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:get/get.dart';

import '../controllers/recommended_product_controller.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(productRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}