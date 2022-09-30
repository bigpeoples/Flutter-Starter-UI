import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TMProfileComponent extends StatelessWidget {
  const TMProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height() * 0.18,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      decoration: boxDecorationDefault(color: context.cardColor),
      child: Row(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(color: tmPrimaryColor, borderRadius: radius(8)),
            child: Image.asset('images/toDoList/tmruby.png', color: yellow, height: 30, fit: BoxFit.cover),
          ),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Upgraded to', style: secondaryTextStyle()),
              Text('Premium', style: boldTextStyle(size: 22)),
              8.height,
              Text('This subscription is auto renewable ', style: primaryTextStyle(size: 12)),
            ],
          )
        ],
      ),
    );
  }
}
