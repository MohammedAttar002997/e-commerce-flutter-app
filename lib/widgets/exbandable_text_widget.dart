import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 7.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,

              color: AppColor.paraColor,
              size: Dimensions.font16,
            )
          : Column(
              children: [
                SmallText(
                  color: AppColor.paraColor,
                  height: 1.8,
                  text: hiddenText
                      ? ("$firstHalf....")
                      : (firstHalf + secondHalf),
                  size: Dimensions.font16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? "Show more" : "Show less",
                        color: AppColor.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColor.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
