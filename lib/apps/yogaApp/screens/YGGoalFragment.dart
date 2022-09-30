import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGChartComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGTrainingWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGGoalFragment extends StatefulWidget {
  const YGGoalFragment({Key? key}) : super(key: key);

  @override
  _YGGoalFragmentState createState() => _YGGoalFragmentState();
}

class _YGGoalFragmentState extends State<YGGoalFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Goal', color: context.scaffoldBackgroundColor, showBack: false, textColor: yg_primaryColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('This Week', style: boldTextStyle(size: 20)),
            8.height,
            Container(
              height: 150,
              padding: EdgeInsets.only(top: 16),
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: yg_primaryColor),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Calories', style: secondaryTextStyle(color: Colors.white)),
                      Text('160,5Kcal', style: primaryTextStyle(color: Colors.white, size: 18)),
                      20.height,
                      Text('Time', style: secondaryTextStyle(color: Colors.white)),
                      Text('1:03:30', style: primaryTextStyle(color: Colors.white, size: 18)),
                    ],
                  ).paddingOnly(left: 16, top: 8).expand(),
                  YGChartWidget().paddingOnly(right: 16),
                ],
              ),
            ),
            16.height,
            Text('Training', style: boldTextStyle(size: 20)),
            YGTrainingWidget(list: goalDataList),
            16.height,
            Text('Recommended', style: boldTextStyle(size: 20)),
            16.height,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: goalImageList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  height: 150,
                  width: context.width(),
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Image.asset(goalImageList[index].url!, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
