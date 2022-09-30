import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGTopicDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class YGHealthyTipsFragment extends StatefulWidget {
  const YGHealthyTipsFragment({Key? key}) : super(key: key);

  @override
  _YGHealthyTipsFragmentState createState() => _YGHealthyTipsFragmentState();
}

class _YGHealthyTipsFragmentState extends State<YGHealthyTipsFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Healthy Tips', showBack: false, textColor: yg_primaryColor, color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            HorizontalList(
              itemCount: healthyTipsDataList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: context.width() * .40,
                  margin: EdgeInsets.all(4),
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        healthyTipsDataList[index].url!,
                        fit: BoxFit.cover,
                        height: 110,
                        width: context.width() * .40,
                      ).cornerRadiusWithClipRRect(8),
                      Container(
                        height: 110,
                        width: context.width() * .40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[Colors.black38, Colors.black38, Colors.black38],
                          ),
                        ),
                      ),
                      Text(healthyTipsDataList[index].text!, style: boldTextStyle(color: Colors.white, size: 14)).center(),
                    ],
                  ),
                );
              },
            ),
            8.height,
            Text('Hot Topics', style: boldTextStyle(size: 20)).paddingOnly(left: 16, right: 16, bottom: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                healthTopicDataList.length,
                (index) {
                  return Container(
                    width: context.width() * 0.45,
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                    child: Column(
                      children: [
                        Image.asset(healthTopicDataList[index].url!, fit: BoxFit.cover, height: 180).cornerRadiusWithClipRRect(8),
                        Text(
                          healthTopicDataList[index].text!,
                          style: boldTextStyle(size: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(top: 4, left: 8),
                        Row(
                          children: [
                            healthTopicDataList[index].isLike!
                                ? Icon(
                                    Icons.favorite_border,
                                    color: iconColorSecondary,
                                  )
                                : Icon(Icons.favorite, color: Colors.red).onTap(() {
                                    healthTopicDataList[index].isLike = !healthTopicDataList[index].isLike!;
                                    healthTopicDataList[index].isLike! ? healthTopicDataList[index].like = healthTopicDataList[index].like! - 1 : healthTopicDataList[index].like = healthTopicDataList[index].like! + 1;
                                    setState(() {});
                                  }),
                            4.width,
                            Text(healthTopicDataList[index].like.toString(), style: secondaryTextStyle()),
                            10.width,
                            Icon(
                              MaterialCommunityIcons.comment_processing,
                              color: iconColorSecondary,
                            ),
                            4.width,
                            Text(healthTopicDataList[index].comment.toString(), style: secondaryTextStyle()),
                          ],
                        ).paddingAll(6),
                      ],
                    ),
                  ).onTap(
                    () {
                      YGTopicDetailsScreen(text: healthTopicDataList[index].text, url: healthTopicDataList[index].url).launch(context);
                    },
                  );
                },
              ),
            ).center(),
          ],
        ),
      ),
    );
  }
}
