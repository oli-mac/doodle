import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/custome_textfeild.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                                text: 'Dashboard',
                                style: appstyle(18, AppConstants.appLight,
                                    FontWeight.bold)),
                            Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: AppConstants.appLight,
                                    borderRadius: BorderRadius.circular(9)),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.add,
                                    color: AppConstants.appDark,
                                  ),
                                )),
                          ])),
                  const HeightSpacer(height: 20),
                  CustomeTextFiled(
                    keyBoardtype: TextInputType.text,
                    hintText: "Search",
                    hintStyle: appstyle(
                        16, AppConstants.appGrayLight, FontWeight.normal),
                    controller: search,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(14),
                      child: GestureDetector(
                        child: const Icon(
                          AntDesign.search1,
                          color: AppConstants.appGrayLight,
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      FontAwesome.sliders,
                      color: AppConstants.appGrayLight,
                    ),
                  ),
                  const HeightSpacer(height: 15)
                ],
              ),
            )),
        body: Center(
          child: ReusableText(
              text: 'Todo',
              style: appstyle(26, AppConstants.appLight, FontWeight.w600)),
        ));
  }
}
