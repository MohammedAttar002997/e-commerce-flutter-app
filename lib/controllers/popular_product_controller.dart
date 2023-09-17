import 'package:flutter_ecommerce_app_clean_code/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo productRepo;

  PopularProductController({required this.productRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await productRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got some products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {}
  }
}
