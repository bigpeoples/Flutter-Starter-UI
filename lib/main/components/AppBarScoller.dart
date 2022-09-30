import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppBarWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBarScroller extends StatelessWidget {
  static String tag = '/AppBarScroller';

  final String? title;
  final String? description;
  final Widget? child;

  AppBarScroller({this.title, this.description, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height(),
        width: context.width(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: AppBarWidget(
                title: title,
                description: description,
              ).visible(title.validate().isNotEmpty),
            ),
            Container(child: child, margin: EdgeInsets.only(top: description.validate().isNotEmpty ? 84 : 75)),
          ],
        ),
      ),
    );
  }
}
