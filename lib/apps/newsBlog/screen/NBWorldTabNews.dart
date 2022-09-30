import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/component/NBWoldListWidget.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/NBDataProviders.dart';

class NBWorldTabNewsList extends StatefulWidget {
  @override
  _NBWorldTabNewsListState createState() => _NBWorldTabNewsListState();
}

class _NBWorldTabNewsListState extends State<NBWorldTabNewsList> {
  List<NewsModel> worldTabNewsVertical = worldTabVertical();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            spacing: 16,
            children: worldTabNewsVertical.map((data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: data.tag!,
                    child: commonCachedNetworkImage(data.img!, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                  ),
                  8.height,
                  Text(data.subTitle!, style: boldTextStyle()),
                  Row(
                    children: [
                      Text(data.type!, style: primaryTextStyle(color: primaryColor)),
                      8.width,
                      Icon(Icons.circle, size: 5, color: grey),
                      8.width,
                      Text(data.timeAgo!, style: secondaryTextStyle()).expand(),
                      PopupMenuButton(
                        onSelected: choiceAction,
                        icon: Icon(AntDesign.ellipsis1),
                        itemBuilder: (BuildContext context) {
                          return PopUp.choices.map((String choice) {
                            return PopupMenuItem(value: choice, child: Text(choice));
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ],
              ).onTap(() {
                NBNewsDetailsScreen(data: data).launch(context);
              }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white);
            }).toList(),
          ).paddingOnly(left: 16, right: 16, top: 16),
          NBWoldListWidget()
        ],
      ),
    );
  }
}
