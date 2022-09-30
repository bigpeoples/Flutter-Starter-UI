import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGYogaBasicForBeginnerScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGProgramCourseWidget extends StatelessWidget {
  final List? list;

  YGProgramCourseWidget({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeTabList.length,
        itemBuilder: (context, index) {
          return Container(
            width: context.width(),
            margin: EdgeInsets.only(top: 8, bottom: 8),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(homeTabList[index].url!, fit: BoxFit.cover, height: 180, width: context.width()).cornerRadiusWithClipRRect(8),
                Text(homeTabList[index].text!, style: boldTextStyle()).paddingOnly(left: 8, top: 4),
                Text(homeTabList[index].subtitle!, style: secondaryTextStyle()).paddingOnly(left: 8, top: 4, bottom: 8),
              ],
            ),
          ).onTap(() {
            YGYogaBasicForBeginnerScreen(name: list![index].text).launch(context);
          });
        });
  }
}
