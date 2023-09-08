import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.50;
  static double pageViewContainer = screenHeight / 3.64;
  static double pageViewTextContainer = screenHeight / 6.68;

  // dynamic height padding and margin
  static double height10 = screenHeight / 80.2;
  static double height12 = screenHeight / 66.83;
  static double height20 = screenHeight / 40.1;
  static double height25 = screenHeight / 32.08;
  static double height45 = screenHeight / 17.82;
  static double listHeight = screenHeight / 1.14;

  // dynamic width padding and margin
  static double width10 = screenHeight / 80.2;
  static double width12 = screenHeight / 66.83;
  static double width20 = screenHeight / 40.1;
  static double width25 = screenHeight / 32.08;
  static double width45 = screenHeight / 17.82;

  //fonts
  static double font20 = screenHeight / 40.1;
  static double font12 = screenHeight / 66.83;

  //radius
  static double radius15 = screenHeight / 53.46;
  static double radius20 = screenHeight / 40.1;
  static double radius30 = screenHeight / 26.73;

  //icon size
  static double iconSize24 = screenHeight / 33.41;

  //image size
  static double imageSizeHeight = screenHeight / 8.02;
  static double imageSizeWidth = screenHeight / 6.68;
}
