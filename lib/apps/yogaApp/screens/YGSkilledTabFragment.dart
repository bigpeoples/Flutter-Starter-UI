import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGYogaBasicForBeginnerScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGSkilledTabFragment extends StatefulWidget {
  const YGSkilledTabFragment({Key? key}) : super(key: key);

  @override
  _YGSkilledTabFragmentState createState() => _YGSkilledTabFragmentState();
}

class _YGSkilledTabFragmentState extends State<YGSkilledTabFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      itemCount: skilledList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8),
          width: context.width() * .45,
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(skilledList[index].url!, fit: BoxFit.cover, height: 200, width: context.width()).cornerRadiusWithClipRRect(8),
              Text(
                skilledList[index].text!,
                style: boldTextStyle(size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(left: 8, top: 4),
              Text(skilledList[index].subtitle!, style: secondaryTextStyle()).paddingOnly(left: 8, top: 4, bottom: 4),
            ],
          ),
        ).onTap(() {
          YGYogaBasicForBeginnerScreen(name: skilledList[index].text).launch(context);
        });
      },
    );
  }
}
