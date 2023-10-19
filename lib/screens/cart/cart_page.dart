import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/home/main_home_page.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/app_icon.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height12),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.height20 * 5,
                              height: Dimensions.height20 * 5,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstant.BASE_URL +
                                        AppConstant.UPLOAD_URL +
                                        cartController.getItems[index].img!,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text:
                                          cartController.getItems[index].name!,
                                      color: Colors.black54,
                                    ),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text:
                                              "\$ ${cartController.getItems[index].price.toString()}",
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                            Dimensions.width10,
                                            Dimensions.height10,
                                            Dimensions.width10,
                                            Dimensions.height10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(false);
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: AppColor.signColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              BigText(text: "0"),
                                              //popularProduct.inCartItems.toString(),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(true);
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: AppColor.signColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
