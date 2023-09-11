import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/exbandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                ),
                padding:  EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10),
                child: Center(
                  child: BigText(
                    text: "Creole Rice Side Dish Recipe",
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColor.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food03.jpg",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                  child: const ExpandableTextWidget(
                    text:
                        "Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesChicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. Chicken is a popular and versatile protein source enjoyed by people all around the world. Whether grilled, roasted, fried, or baked, chicken dishes offer a wide range of flavors and culinary possibilities. Its tender and juicy meat, combined with its mild taste, makes chicken a favorite ingredient in numerous cuisines. makes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisinesmakes chicken a favorite ingredient in numerous cuisines",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              Dimensions.width20 * 2.5,
              Dimensions.height10,
              Dimensions.width20 * 2.5,
              Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                    text: "\$12.88  X  0 ",
                    color: AppColor.mainBlackColor,
                    size: Dimensions.font26),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.pageViewTextContainer,
            padding: EdgeInsets.fromLTRB(
              Dimensions.width20,
              Dimensions.height25,
              Dimensions.width20,
              Dimensions.height25,
            ),
            decoration: BoxDecoration(
              color: AppColor.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(
                      Dimensions.width10,
                      Dimensions.height10,
                      Dimensions.width10,
                      Dimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: AppIcon(
                      icon: Icons.favorite,
                      backgroundColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      iconColor: AppColor.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    Dimensions.width20,
                    Dimensions.height20,
                    Dimensions.width20,
                    Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius20,
                    ),
                    color: AppColor.mainColor,
                  ),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
