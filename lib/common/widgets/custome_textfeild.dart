import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:flutter/material.dart';

class CustomeTextFiled extends StatelessWidget {
  const CustomeTextFiled(
      {super.key,
      required this.keyBoardtype,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      this.controller,
      this.onChanged});

  final TextInputType keyBoardtype;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppConstants.appWidth * 0.9,
        decoration: BoxDecoration(
            color: AppConstants.appLight,
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.appRadius))),
        child: TextFormField(
          keyboardType: keyBoardtype,
          controller: controller,
          cursorHeight: 25,
          onChanged: onChanged,
          style: appstyle(18, AppConstants.appDark, FontWeight.w700),
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              prefixIconColor: AppConstants.appDark,
              hintStyle: hintStyle,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: AppConstants.appRed, width: 0.5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: AppConstants.appRed, width: 0.5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: AppConstants.appDark, width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 0.5)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: AppConstants.appGrayDark, width: 0.5))),
        ));
  }
}
