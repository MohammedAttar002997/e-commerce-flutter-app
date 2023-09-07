import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/home/food_page_body.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current screen size${MediaQuery
        .of(context)
        .size
        .height
        .toString() }");
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:  EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height12),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Syria",
                      size: 25,
                      color: AppColor.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Aleppo",
                          color: Colors.black54,
                        ),
                        const Icon(
                          (Icons.arrow_drop_down_rounded),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColor.mainColor,
                  ),
                  child:  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                ),
              ],
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
