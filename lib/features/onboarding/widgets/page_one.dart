import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

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
                child: Image.asset('assets/images/todo.png')),
            HeightSpacer(height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Doodle',
                  style: appstyle(30, AppConstants.appLight, FontWeight.w600),
                ),
                HeightSpacer(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Doodle is a simple todo app that helps you keep track of your daily tasks',
                    textAlign: TextAlign.center,
                    style: appstyle(
                        16, AppConstants.appGrayLight, FontWeight.normal),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
