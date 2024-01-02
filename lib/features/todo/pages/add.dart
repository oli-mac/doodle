import 'dart:ui';

import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/custome_textfeild.dart';
import 'package:doodle/common/widgets/cutome_otn_button.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Overlay(
        initialEntries: [
          //! back ground image
          OverlayEntry(builder: (context) {
            return Stack(
              children: [
                //background image
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: .5,
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/background.png"),
                                      fit: BoxFit.cover)),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.0)),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                //back button at the top
              ],
            );
          }),

          //! main content
          OverlayEntry(builder: (context) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: DraggableScrollableSheet(
                initialChildSize: 0.85,
                minChildSize: 0.4,
                // maxChildSize: 0.75,
                builder: (context, controller) {
                  return ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppConstants.appDark,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListView(controller: controller, children: [
                            HeightSpacer(height: 30),
                            CustomeTextFiled(
                              keyBoardtype: TextInputType.text,
                              controller: _titleController,
                              hintText: "Title",
                              hintStyle: appstyle(18, AppConstants.appGrayDark,
                                  FontWeight.normal),
                            ),
                            HeightSpacer(height: 30),
                            CustomeTextFiled(
                              keyBoardtype: TextInputType.text,
                              controller: _discController,
                              hintText: "Discription",
                              hintStyle: appstyle(18, AppConstants.appGrayDark,
                                  FontWeight.normal),
                            ),
                            HeightSpacer(height: 30),
                            CustomOtnButton(
                                width: AppConstants.appWidth,
                                height: 60.h,
                                colors: AppConstants.appLight,
                                color2: AppConstants.appBluelight,
                                text: "Set Date"),
                            HeightSpacer(height: 30),
                            CustomOtnButton(
                                width: AppConstants.appWidth,
                                height: 60.h,
                                colors: AppConstants.appLight,
                                color2: AppConstants.appBluelight,
                                text: "Start Time"),
                            HeightSpacer(height: 30),
                            CustomOtnButton(
                                width: AppConstants.appWidth,
                                height: 60.h,
                                colors: AppConstants.appLight,
                                color2: AppConstants.appBluelight,
                                text: "End Time"),
                            HeightSpacer(height: 30),
                            CustomOtnButton(
                                width: AppConstants.appWidth,
                                height: 60.h,
                                colors: AppConstants.appLight,
                                color2: AppConstants.appGreen,
                                text: "Submit"),
                          ]),
                        ),
                      ));
                },
              ),
            ));
          }),
        ],
      ),
    );
  }
}
