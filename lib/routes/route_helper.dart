import 'package:flutter_ecommerce_app_clean_code/screens/cart/cart_page.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/food/recommended_food_detail.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/home/home_page.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/home/main_home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => initial;

  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId,String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => cartPage;
  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page =Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!),page:page!);
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!,);
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
