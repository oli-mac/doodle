import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOtnButton extends StatelessWidget {
  const CustomOtnButton(
      {super.key,
      this.onTap,
      this.height,
      this.width,
      required this.colors,
      required this.text});

  final Function()? onTap;
  final double? height;
  final double? width;
  final Color colors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppConstants.appBKGray,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: colors, width: 1),
          ),
          child: Center(
              child: ReusableText(
                  text: text, style: appstyle(16, colors, FontWeight.w600))),
        ));
  }
}
