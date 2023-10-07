import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/routes/route_helper.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/exbandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const AppIcon(icon: Icons.clear),
                  onTap: () {
                    Get.toNamed(
                      RouteHelper.getInitial(),
                    );
                  },
                ),
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
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
                padding: EdgeInsets.only(
                    top: Dimensions.height10, bottom: Dimensions.height10),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColor.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstant.BASE_URL + AppConstant.UPLOAD_URL + product.img!,
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
                  child: ExpandableTextWidget(
                    text: product.description!,
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
                    text: "\$ ${product.price!}  X  0 ",
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
