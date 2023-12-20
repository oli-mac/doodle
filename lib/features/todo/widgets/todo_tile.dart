import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.discription,
      this.start,
      this.end,
      this.editWidget,
      this.delete,
      this.Switcher});

  final Color? color;
  final String? title;
  final String? discription;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? Switcher;
  final Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Stack(children: [
        Container(
            padding: EdgeInsets.all(4.h),
            width: AppConstants.appWidth,
            decoration: BoxDecoration(
                color: AppConstants.appGrayLight,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConstants.appRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          color: color ?? AppConstants.appRed,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.appRadius))),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      //origonaly this had was wrapped in a sized box with wirdth kwidth*0.6
                      child: SizedBox(
                        width: AppConstants.appWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? 'Title?',
                              style: appstyle(
                                  18, AppConstants.appLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 3),
                            ReusableText(
                              text: discription ?? 'Discription...',
                              style: appstyle(
                                  12, AppConstants.appLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25.h,
                                  width: AppConstants.appWidth * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConstants.appGrayDark,
                                          width: 0.3),
                                      color: AppConstants.appDark,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppConstants.appRadius))),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start - $end",
                                      style: appstyle(12, AppConstants.appLight,
                                          FontWeight.normal),
                                    ),
                                  ),
                                ),
                                const WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                        MaterialCommunityIcons.delete_circle,
                                        color: AppConstants.appDark,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Switcher,
                )
              ],
            ))
      ]),
    );
  }
}
