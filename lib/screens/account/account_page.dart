import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/account_widget.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/app_icon.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';

import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              iconSize: Dimensions.height30 + Dimensions.height45,
              size: Dimensions.height15 * 10,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColor.mainColor,
                        size: Dimensions.height10 * 5,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(
                        text: "Mohammed",
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColor.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(
                        text: "+963981085261",
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColor.yellowColor,
                        size: Dimensions.height10 * 5,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(
                        text: "mohamedattar8300@gmail.com",
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColor.mainColor,
                        size: Dimensions.height10 * 5,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(
                        text: "Fill in your location",
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        size: Dimensions.height10 * 5,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                      ),
                      bigText: BigText(
                        text: "Mohammed",
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
