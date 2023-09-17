import 'package:flutter_ecommerce_app_clean_code/data/api/api_client.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getProductData(AppConstant.POPULAR_PRODUCT_URI);
  }
}
