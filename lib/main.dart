import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'screens/home/main_home_page.dart';

void main() {
  runApp(const FlutterEcommerceApp());
}

class FlutterEcommerceApp extends StatelessWidget {
  const FlutterEcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecommendedFoodDetail(),
    );
  }
}
