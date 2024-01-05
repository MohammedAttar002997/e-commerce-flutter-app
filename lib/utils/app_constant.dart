class AppConstant {
  static const String APP_NAME = "BestFoodEverApp";
  static const int APP_VERSION = 1;

  // static const String BASE_URL = "http://127.0.0.1:8000";
  static const String BASE_URL = "http://10.0.2.2:8000";
  static const String BASE_URL_FOR_MOBILE = "http://10.0.2.2:8000";
  static const String BASE_URL_FOR_IMAGE = "http://127.0.0.1:8000";
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String DRUBKS_URI = "/api/v1/products/drinks";
  static const String UPLOAD_URL = "/uploads/";

  //auth endpoint
  static const String REGISTRATION_URL = "/api/v1/auth/register";
  static const String LOGIN_URL = "/api/v1/auth/login";

  static const String TOKEN = "DBtoken";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-History-list";
}
