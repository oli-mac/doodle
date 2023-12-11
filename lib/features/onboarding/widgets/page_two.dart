import 'package:doodle/common/utils/constants.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.appHeight,
      width: AppConstants.appWidth,
      color: AppConstants.appDark,
    );
  }
}
