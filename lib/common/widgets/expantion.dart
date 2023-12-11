import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/titles.dart';
import 'package:flutter/material.dart';

class Expantion extends StatelessWidget {
  const Expantion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppConstants.appBkLight,
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.appRadius))),
      child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: BottomTitles(),
          )),
    );
  }
}
