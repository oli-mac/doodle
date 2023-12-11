import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/cutome_otn_button.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/features/auth/pages/login.dart';
import 'package:doodle/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.appHeight,
      width: AppConstants.appWidth,
      color: AppConstants.appDark,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset('assets/images/note_3.png')),
            HeightSpacer(height: 100),
            CustomOtnButton(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => Login())));
                },
                width: AppConstants.appWidth * 0.9,
                height: AppConstants.appHeight * 0.06,
                colors: AppConstants.appLight,
                text: "login with phone number")
          ]),
    );
  }
}
