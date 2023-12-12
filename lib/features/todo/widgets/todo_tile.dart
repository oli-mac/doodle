import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.discription,
      this.start,
      this.end,
      this.editWidget});

  final Color? color;
  final String? title;
  final String? discription;
  final String? start;
  final String? end;
  final Widget? editWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(children: [
        Container(
            padding: EdgeInsets.all(8.h),
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
                    WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: title ?? 'Title?',
                            style: appstyle(
                                18, AppConstants.appLight, FontWeight.bold),
                          ),
                          HeightSpacer(height: 3),
                          ReusableText(
                            text: discription ?? 'Discription...?',
                            style: appstyle(
                                12, AppConstants.appLight, FontWeight.bold),
                          ),
                          HeightSpacer(height: 10),
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
                              WidthSpacer(width: 20),
                              Row(
                                children: [
                                  SizedBox(
                                    child: editWidget,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  color: AppConstants.appLight,
                )
              ],
            ))
      ]),
    );
  }
}
