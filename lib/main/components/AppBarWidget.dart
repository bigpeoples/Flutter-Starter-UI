import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AppBarWidget extends StatelessWidget {
  static String tag = '/AppBarWidget';
  final String? title;
  final String? description;

  AppBarWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(
          borderRadius: radiusOnly(bottomLeft: 20, bottomRight: 20),
          color: appStore.cardColor,
          boxShadow: defaultBoxShadow(),
        ),
        width: context.width(),
        padding: EdgeInsets.only(top: 16, left: 8, right: 16, bottom: 16),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            BackButton(),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.validate(), style: boldTextStyle(size: 20)),
                Text(description.validate(), style: secondaryTextStyle(size: 12)).visible(description.validate().isNotEmpty),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
