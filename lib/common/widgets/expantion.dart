import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/titles.dart';
import 'package:flutter/material.dart';

class ExpansionTiles extends StatelessWidget {
  const ExpansionTiles(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      required this.children,
      this.trailing});

  final String text;
  final String text2;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;
  final Widget? trailing;

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
            title: BottomTitles(
              text: text,
              text2: text2,
            ),
            tilePadding: EdgeInsets.zero,
            children: children,
            onExpansionChanged: onExpansionChanged,
            trailing: trailing,
          )),
    );
  }
}
