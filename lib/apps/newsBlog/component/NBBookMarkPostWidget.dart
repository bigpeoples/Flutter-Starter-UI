import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class NBBookMarkPostWidget extends StatefulWidget {
  final NewsModel? newsData;

  NBBookMarkPostWidget({this.newsData});

  @override
  NBBookMarkPostWidgetState createState() => NBBookMarkPostWidgetState();
}

class NBBookMarkPostWidgetState extends State<NBBookMarkPostWidget> {
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
    return Row(
      children: [
        8.width,
        Hero(
          tag: widget.newsData!.tag!,
          child: commonCachedNetworkImage(widget.newsData!.img!, fit: BoxFit.cover, height: 120).cornerRadiusWithClipRRect(10),
        ).expand(flex: 2),
        8.width,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.newsData!.title!, style: primaryTextStyle()),
            Text(widget.newsData!.subTitle!, style: boldTextStyle(size: 12)),
            Row(
              children: [
                Text(widget.newsData!.type!, style: secondaryTextStyle(color: primaryColor)),
                8.width,
                Icon(Icons.circle, size: 5, color: grey),
                8.width,
                Text(widget.newsData!.timeAgo!, style: secondaryTextStyle()).expand(),
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
        ).expand(flex: 3),
      ],
    ).paddingOnly(left: 8, right: 16, bottom: 16).onTap(() {
      NBNewsDetailsScreen(data: widget.newsData!).launch(context);
    }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white);
  }
}
