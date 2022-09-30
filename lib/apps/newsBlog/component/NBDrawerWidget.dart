import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class NBDrawerWidget extends StatefulWidget {
  @override
  NBDrawerWidgetState createState() => NBDrawerWidgetState();
}

class NBDrawerWidgetState extends State<NBDrawerWidget> {
  List<NewsModel> list = drawerList();

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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Gojou Satoru', style: boldTextStyle(color: white)),
            accountEmail: Text('gojousatoru@ymail.com', style: primaryTextStyle(color: white)),
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            currentAccountPicture:
                commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/gs.jpg', height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
          ),
          ...list.map((e) {
            return ListTile(
              leading: e.icon,
              title: Text(e.title!, style: primaryTextStyle()),
              onTap: () {
                if (e.widget == null) {
                  finish(context);
                } else {
                  finish(context);
                  e.widget!.launch(context);
                }
              },
            );
          }).toList()
        ],
      ),
    );
  }
}
