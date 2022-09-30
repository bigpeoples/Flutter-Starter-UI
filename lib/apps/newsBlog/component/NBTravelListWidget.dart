import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class NBTravelListWidget extends StatefulWidget {
  @override
  NBTravelListWidgetState createState() => NBTravelListWidgetState();
}

class NBTravelListWidgetState extends State<NBTravelListWidget> {
  List<NewsModel> travelTabNewsHorizontal = travelTabHorizontal();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      padding: EdgeInsets.only(left: 8, right: 8),
      spacing: 0,
      itemCount: travelTabNewsHorizontal.length,
      itemBuilder: (BuildContext context, int index) {
        NewsModel data = travelTabNewsHorizontal[index];
        return Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          //height: 250,
          width: 190,
          child: Column(
            children: [
              Hero(
                tag: data.tag!,
                child: commonCachedNetworkImage(data.img!, fit: BoxFit.cover, height: 130).cornerRadiusWithClipRRect(10),
              ),
              8.height,
              Text(data.subTitle!, style: boldTextStyle(), overflow: TextOverflow.ellipsis, maxLines: 3),
              Row(
                children: [
                  Text(data.type!, style: primaryTextStyle(color: primaryColor)),
                  8.width,
                  Icon(Icons.circle, size: 5, color: grey),
                  8.width,
                  Text(data.timeAgo!, style: TextStyle(color: grey)).expand(),
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
        });
      },
    );
  }
}
