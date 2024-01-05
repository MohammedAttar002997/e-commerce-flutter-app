import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/base/custom_loader.dart';
import 'package:flutter_ecommerce_app_clean_code/base/show_custom_snackbar.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/models/signup_body_model.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/app_text_field.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = [
      "f.png",
      "tw.png",
      "g.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty || !GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty || password.length < 6) {
        showCustomSnackBar("Password can' be less than 6 characters",
            title: "Password");
      } else {
        showCustomSnackBar(
          "All went well",
          title: "Perfect",
        );
        SignUpBody signUpBody = SignUpBody(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );
        authController.registration(signUpBody).then(
          (status) {
            if (status.isSuccess) {
              print("Success register");
            } else {
              showCustomSnackBar(status.message);
            }
          },
        );
        print(signUpBody.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
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
                      isObscure: true,
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.password_sharp,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //name
                    AppTextField(
                      textController: nameController,
                      hintText: "Name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AppTextField(
                      textController: phoneController,
                      hintText: "Phone",
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Sign up button
                    GestureDetector(
                      onTap: () {
                        _registration(authController);
                      },
                      child: Container(
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
                            text: "Sign up",
                            color: Colors.white,
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //tag line
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an account already?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.03,
                    ),
                    //sign up options
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Sign up using one of the following methods",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.02,
                    ),
                    Wrap(
                      children: List.generate(
                        signUpImages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              "assets/images/${signUpImages[index]}",
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
