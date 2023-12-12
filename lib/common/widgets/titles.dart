import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppConstants.appWidth,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer(builder: (context, watch, child) {
                  return Container(
                    height: 80,
                    width: 5,
                    decoration: BoxDecoration(
                        color: AppConstants.appGreen,

                        ///TODO: Add dynamic colors
                        borderRadius: BorderRadius.circular(9)),
                    // child: GestureDetector(
                    //   onTap: () {},
                    //   child: const Icon(
                    //     Icons.add,
                    //     color: AppConstants.appDark,
                    //   ),
                    // )
                  );
                }),
                const WidthSpacer(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: text,
                            style: appstyle(
                                20, AppConstants.appLight, FontWeight.bold)),
                        HeightSpacer(height: 10),
                        ReusableText(
                            text: text2,
                            style: appstyle(
                                12, AppConstants.appLight, FontWeight.normal)),
                      ]),
                )
              ],
            )));
  }
}
