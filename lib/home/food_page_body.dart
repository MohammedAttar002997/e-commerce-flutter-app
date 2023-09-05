import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,

          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: AppColor.mainColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 / currScale) / 2;
      matrix = Matrix4.diagonal3Values(0, currScale, 0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = 1 - (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 / currScale) / 2;
      matrix = Matrix4.diagonal3Values(0, currScale, 0);
      matrix = Matrix4.diagonal3Values(0, currScale, 0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 / currScale) / 2;
      matrix = Matrix4.diagonal3Values(0, currScale, 0);
      matrix = Matrix4.diagonal3Values(0, currScale, 0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(0, currScale, 0)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
      ;
    }
    return Stack(
      children: [
        Container(
          height: _height,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/food02.jpg",
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "4.5"),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "1287"),
                      const SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "Comments"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColor.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColor.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        text: "32min",
                        iconColor: AppColor.iconColor2,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
