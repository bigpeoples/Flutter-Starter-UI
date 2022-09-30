import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/NBDataProviders.dart';

class NBLifeTabList extends StatefulWidget {
  @override
  _NBLifeTabListState createState() => _NBLifeTabListState();
}

class _NBLifeTabListState extends State<NBLifeTabList> {
  List<NewsModel> lifeTabList = lifeTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: lifeTabList.map((data) {
          return Container(
            decoration: boxDecorationRoundedWithShadow(8,backgroundColor:context.cardColor),
            height: 240,
            width: context.width() * 0.5 - 24,
            child: Column(
              children: [
                Hero(
                  tag: data.tag!,
                  child: commonCachedNetworkImage(data.img!,width: context.width() * 0.5 - 24,height: 120,fit: BoxFit.cover),
                ).cornerRadiusWithClipRRectOnly(topLeft: 10,topRight: 10),
                8.height,
                Text(data.subTitle!, style: boldTextStyle(size: 14), maxLines: 3, overflow: TextOverflow.ellipsis).paddingOnly(left: 4,right: 4),
                Row(
                  children: [
                    Text(data.type!, style: secondaryTextStyle(color: primaryColor)),
                    4.width,
                    Icon(Icons.circle, size: 5, color: grey),
                    4.width,
                    Text(data.timeAgo!, style: secondaryTextStyle()).expand(),
                    PopupMenuButton(
                      padding: EdgeInsets.zero,
                      onSelected: choiceAction,
                      icon: Icon(AntDesign.ellipsis1),
                      itemBuilder: (BuildContext context) {
                        return PopUp.choices.map((String choice) {
                          return PopupMenuItem(value: choice, child: Text(choice));
                        }).toList();
                      },
                    ),
                  ],
                ).paddingOnly(left: 4,right: 4).expand(),
              ],
            ).onTap(() {
              NBNewsDetailsScreen(data: data).launch(context);
            }),
          );
        }).toList(),
      ).paddingAll(16),
    );
  }
}
