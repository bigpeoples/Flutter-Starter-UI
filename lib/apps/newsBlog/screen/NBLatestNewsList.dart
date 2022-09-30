import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class NBLatestNewsList extends StatefulWidget {
  @override
  _NBLatestNewsListState createState() => _NBLatestNewsListState();
}

class _NBLatestNewsListState extends State<NBLatestNewsList> {
  List<NewsModel> latestNewsList = latestNews();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: latestNewsList.length,
      itemBuilder: (context, index) {
        NewsModel data = latestNewsList[index];
        return Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Hero(
                tag: data.tag!,
                child: commonCachedNetworkImage(data.img!,fit: BoxFit.cover).validate().cornerRadiusWithClipRRect(10),
              ),
              8.height,
              Align(
                alignment: Alignment.topLeft,
                child: Text(data.title!, style: secondaryTextStyle()).validate(),
              ),
              8.height,
              Text(data.subTitle!, style: boldTextStyle()).validate(),
              Row(
                children: [
                  Text(data.type!, style: primaryTextStyle(color: primaryColor)).validate(),
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
        },highlightColor: appStore.isDarkModeOn ? black : white,splashColor: white);
      },
    );
  }
}
