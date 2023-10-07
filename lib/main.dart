import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/routes/route_helper.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/food/recommended_food_detail.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/home/food_page_body.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'screens/home/main_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const FlutterEcommerceApp());
}

class FlutterEcommerceApp extends StatelessWidget {
  const FlutterEcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      home: const MainFoodPage(),
    );
  }
}
