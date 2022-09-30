import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGScheduleScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:nb_utils/nb_utils.dart';

class YGTrainingWidget extends StatelessWidget {
  final List? list;

  YGTrainingWidget({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          height: 85,
          width: context.width(),
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
          child: Row(
            children: [
              Image.asset(list![index].url, fit: BoxFit.fitHeight, width: 100, height: 85).cornerRadiusWithClipRRect(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list![index].label, style: boldTextStyle(color: yg_primaryColor, size: 14)),
                  Text(list![index].text, style: boldTextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis).expand(),
                  5.height,
                  Text(list![index].subtext,
                      style: secondaryTextStyle(
                        size: 12,
                      )),
                ],
              ).paddingAll(8).expand()
            ],
          ),
        ).onTap(
          () {
            YGScheduleScreen(url: list![index].url, text: list![index].text).launch(context);
          },
        );
      },
    );
  }
}
