import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/common/widgets/width_spacer.dart';
import 'package:doodle/features/onboarding/widgets/page_one.dart';
import 'package:doodle/features/onboarding/widgets/page_three.dart';
import 'package:doodle/features/onboarding/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();

  // @override
  // void initState() {
  //   super.initState();
  //   pageController.addListener(() {});
  // }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              // PageTwo(),
              PageThree(),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut);
                            },
                            child: const Icon(Ionicons.chevron_forward_circle,
                                color: Colors.white, size: 30)),
                        const WidthSpacer(width: 5),
                        ReusableText(
                            text: "skip",
                            style: appstyle(
                                15, AppConstants.appLight, FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut);
                        },
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                              dotColor: AppConstants.appYellow,
                              // activeDotColor: AppConstants.appBluelight,
                              dotHeight: 12,
                              dotWidth: 16,
                              spacing: 10),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
