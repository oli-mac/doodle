import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/custome_textfeild.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController search = TextEditingController();

  late final TabController _tabController =
      TabController(length: 2, vsync: this);

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
                      padding: const EdgeInsets.all(14),
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
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(children: [
            const HeightSpacer(height: 25),
            Row(
              children: [
                const Icon(
                  FontAwesome.tasks,
                  color: AppConstants.appLight,
                  size: 20,
                ),
                const WidthSpacer(width: 10),
                ReusableText(
                    text: "Today's tasks",
                    style: appstyle(18, AppConstants.appLight, FontWeight.bold))
              ],
            ),
            const HeightSpacer(height: 25),
            Container(
              decoration: BoxDecoration(
                  color: AppConstants.appLight,
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstants.appRadius))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    color: AppConstants.appDark,
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppConstants.appRadius))),
                labelPadding: EdgeInsets.zero,
                isScrollable: false,
                controller: _tabController,
                labelColor: AppConstants.appBluelight,
                labelStyle:
                    appstyle(24, AppConstants.appBluelight, FontWeight.w700),
                unselectedLabelColor: AppConstants.appLight,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: AppConstants.appWidth * 0.5,
                      child: Center(
                        child: ReusableText(
                            text: 'Pending',
                            style: appstyle(16, AppConstants.appGrayLight,
                                FontWeight.bold)),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: AppConstants.appWidth * 0.5,
                      child: Center(
                        child: ReusableText(
                            text: 'Completed',
                            style: appstyle(16, AppConstants.appGrayLight,
                                FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 25),
            SizedBox(
              height: AppConstants.appHeight * 0.3,
              width: AppConstants.appWidth,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConstants.appRadius)),
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    color: AppConstants.appGrayLight,
                    height: AppConstants.appHeight * 0.3,
                  ),
                  Container(
                    color: AppConstants.appBkLight,
                    height: AppConstants.appHeight * 0.3,
                  ),
                ]),
              ),
            )
          ]),
        )));
  }
}
