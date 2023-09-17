import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce_app_clean_code/models/products_model.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/colors.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/big_text.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  SwiperController swiperController = SwiperController();
  var _currPageValue = 0.0;
  var _currPageIndex = 0;

  // final double _scaleFactor = 0.8;
  // final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageIndex = swiperController.index;
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
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: Swiper(
                    itemCount: popularProduct.popularProductList.length,
                    index: _currPageIndex,
                    onIndexChanged: (index) {
                      setState(() {
                        _currPageIndex = index;
                      });
                    },
                    loop: false,
                    controller: swiperController,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularProduct.popularProductList[position]);
                    },
                  ),
                  // PageView.builder(
                  //     controller: pageController,
                  //     itemCount: 5,
                  //     itemBuilder: (context, position) {
                  //       return _buildPageItem(position);
                  //     }),
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: _currPageIndex.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColor.mainColor,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height25,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 2,
                ),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          print(
              "This is my recommended ${recommendedProduct.recommendedProductList}");
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.imageSizeWidth,
                            height: Dimensions.imageSizeWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius20,
                              ),
                              color: Colors.white30,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppConstant.BASE_URL +
                                      AppConstant.UPLOAD_URL +
                                      recommendedProduct
                                          .recommendedProductList[index].img,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.imageSizeHeight,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                        text:recommendedProduct.recommendedProductList[index].name ),
                                    SmallText(
                                        text: "With chinese characteristics"),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                          )
                        ],
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel? popularProduct) {
    // Matrix4 matrix = Matrix4.identity();
    // if (index == _currPageValue.floor()) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(0, currScale, 0)
    //     ..setTranslationRaw(0, currTrans, 0);
    // }
    // else if (index == _currPageValue.floor() + 1) {
    //   var currScale = 1 - (_currPageValue - index + 1) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(0, currScale, 0);
    //   matrix = Matrix4.diagonal3Values(0, currScale, 0)
    //     ..setTranslationRaw(0, currTrans, 0);
    // }
    // else if (index == _currPageValue.floor() - 1) {
    //   var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(0, currScale, 0);
    //   matrix = Matrix4.diagonal3Values(0, currScale, 0)
    //     ..setTranslationRaw(0, currTrans, 0);
    // }
    // else {
    //   var currScale = 0.8;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    // }
    return Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstant.BASE_URL +
                      AppConstant.UPLOAD_URL +
                      popularProduct!.img!,
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width25,
              right: Dimensions.width25,
              bottom: Dimensions.height25,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
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
              padding: EdgeInsets.only(
                top: Dimensions.height12,
                left: 15,
                right: 10,
              ),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        ),
      ],
    );
  }
}
