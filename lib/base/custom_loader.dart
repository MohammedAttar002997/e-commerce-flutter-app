import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.width20 * 5,
        height: Dimensions.height20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.height20 * 5 / 2,
          ),
          color: AppColor.mainColor,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
