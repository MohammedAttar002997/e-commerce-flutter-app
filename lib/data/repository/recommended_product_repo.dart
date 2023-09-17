import 'package:flutter_ecommerce_app_clean_code/data/api/api_client.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getProductData(AppConstant.RECOMMENDED_PRODUCT_URI);
  }
}
