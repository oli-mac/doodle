import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Otp'),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConstants.appHeight * 0.12),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset(
                    'assets/images/todo.png',
                    width: AppConstants.appHeight * 0.9,
                    height: 180,
                  )),
              HeightSpacer(height: 26),
              ReusableText(
                  text: "Enter your otp code",
                  style: appstyle(18, AppConstants.appLight, FontWeight.bold)),
              HeightSpacer(height: 26),
              Pinput(
                length: 6,
                autofocus: true,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  }
                },
                onSubmitted: (value) {
                  if (value.length == 6) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  }
                },
              )
            ],
          )),
        ));
  }
}
