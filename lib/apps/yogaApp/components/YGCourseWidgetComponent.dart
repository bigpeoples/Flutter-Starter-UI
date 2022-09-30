import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGYogaBasicForBeginnerScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class YGCoursesWidgetComponent extends StatelessWidget {
  final List? list;

  YGCoursesWidgetComponent({this.list});

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                list![index].url,
                fit: BoxFit.cover,
                height: 150,
                width: context.width() * .65,
              ).cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
              Text(list![index].text, style: boldTextStyle(size: 14), maxLines: 2, overflow: TextOverflow.ellipsis).paddingOnly(left: 8, top: 8),
              Text(list![index].subtitle, style: secondaryTextStyle()).paddingOnly(left: 8, top: 4, bottom: 8),
            ],
          ),
        ).onTap(() {
          YGYogaBasicForBeginnerScreen(name: list![index].text).launch(context);
        });
      },
    );
  }
}
