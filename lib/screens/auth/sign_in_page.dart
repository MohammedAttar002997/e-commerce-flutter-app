import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/screens/auth/sign_up_page.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/app_text_field.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //app logo
            SizedBox(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/images/restaurant.png",
                  ),
                ),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //email
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //password
            AppTextField(
              textController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //tag line
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.03,
            ),
            //sign in button
            Container(
              height: Dimensions.screenHeight / 13,
              width: Dimensions.screenWidth / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius30,
                ),
                color: AppColor.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign in",
                  color: Colors.white,
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //sign up options
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(
                              () => const SignUpPage(),
                          transition: Transition.fade
                            ),
                      text: " Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
