import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBAboutScreen extends StatefulWidget {
  @override
  NBAboutScreenState createState() => NBAboutScreenState();
}

class NBAboutScreenState extends State<NBAboutScreen> {
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
    return Scaffold(
      appBar: appBarWidget('About', color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 200,
            width: 200,
            decoration: boxDecorationRoundedWithShadow(100),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/newsblog/fireLogo.jpg'),
            ),
          ).center(),
          8.height,
          Text('Sector', style: boldTextStyle()),
          8.height,
          Text('News', style: secondaryTextStyle()),
        ],
      ),
    );
  }
}
