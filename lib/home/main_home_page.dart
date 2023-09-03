import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/home/food_page_body.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.mainColor,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
