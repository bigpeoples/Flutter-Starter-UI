import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/component/NBTravelListWidget.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/NBDataProviders.dart';

class NBTravelTabNewsList extends StatefulWidget {
  @override
  _NBTravelTabNewsListState createState() => _NBTravelTabNewsListState();
}

class _NBTravelTabNewsListState extends State<NBTravelTabNewsList> {
  List<NewsModel> travelTabNewsVertical = travelTabVertical();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...travelTabNewsVertical.map((data) {
            return Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: data.tag!,
                    child: commonCachedNetworkImage(data.img!, fit: BoxFit.fitHeight, height: 250).cornerRadiusWithClipRRect(10),
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
              ),
            ).onTap(() {
              NBNewsDetailsScreen(data: data).launch(context);
            }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white);
          }).toList(),
          NBTravelListWidget()
        ],
      ).paddingOnly(top: 16, bottom: 16),
    );
  }
}
