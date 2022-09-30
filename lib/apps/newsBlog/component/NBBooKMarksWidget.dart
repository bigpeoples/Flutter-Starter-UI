import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBBooKMarksWidget extends StatefulWidget {
  final NewsModel? newsData;

  NBBooKMarksWidget({this.newsData});

  @override
  NBBooKMarksWidgetState createState() => NBBooKMarksWidgetState();
}

class NBBooKMarksWidgetState extends State<NBBooKMarksWidget> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: widget.newsData!.tag!,
          child: commonCacheImageWidget(widget.newsData!.img!, null, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
        ),
        16.height,
        Text(widget.newsData!.title!, style: boldTextStyle()),
        8.height,
        Text(widget.newsData!.subTitle!, style: primaryTextStyle()),
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
        Divider(color: grey)
      ],
    ).paddingOnly(left: 16, right: 16).onTap(() {
      NBNewsDetailsScreen(data: widget.newsData!).launch(context);
    }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white);
  }
}
