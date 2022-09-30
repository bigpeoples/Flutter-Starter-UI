import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/components/TMProfileComponent.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMProfileScreen extends StatefulWidget {
  static String tag = '/TMProfileScreen';

  @override
  TMProfileScreenState createState() => TMProfileScreenState();
}

class TMProfileScreenState extends State<TMProfileScreen> {
  bool isFaceBookSwitch = false;
  bool isTwitterSwitch = false;
  bool isGoogleSwitch = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  void fbSwitchStatus(bool value) {
    isFaceBookSwitch = value;
    setState(() {});
  }

  void twSwitchStatus(bool value) {
    isTwitterSwitch = value;
    setState(() {});
  }

  void googleSwitchStatus(bool value) {
    isGoogleSwitch = value;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        elevation: 0,
        color: context.cardColor,
        backWidget: Icon(Icons.close, color: context.iconColor).onTap(
          () {
            finish(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset('images/toDoList/profile.png', height: context.height() * 0.12, fit: BoxFit.cover).cornerRadiusWithClipRRect(32),
                Container(
                  child: Icon(Icons.add, color: context.iconColor),
                  decoration: boxDecorationDefault(color: context.cardColor, shape: BoxShape.circle, border: Border.all(width: 2)),
                )
              ],
            ).center(),
            16.height,
            SettingItemWidget(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              title: 'User Name',
              subTitle: 'John07',
              titleTextStyle: boldTextStyle(),
              subTitleTextStyle: primaryTextStyle(),
            ),
            8.height,
            SettingItemWidget(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              title: 'Email',
              subTitle: 'opal.rolfson@doris.net',
              titleTextStyle: boldTextStyle(),
              subTitleTextStyle: primaryTextStyle(),
            ),
            16.height,
            Text('Social', style: boldTextStyle(size: 18)).paddingLeft(8),
            4.height,
            SettingItemWidget(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              title: 'Connect to FaceBook',
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                fbSwitchStatus(!isFaceBookSwitch);
              },
              trailing: noteSwitchWidget(
                  noteSwitchValue: isFaceBookSwitch,
                  onTap: (bool value) {
                    fbSwitchStatus(value);
                  }),
            ),
            SettingItemWidget(
              title: 'Connect to Twitter',
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                twSwitchStatus(!isTwitterSwitch);
              },
              trailing: noteSwitchWidget(
                  noteSwitchValue: isTwitterSwitch,
                  onTap: (bool value) {
                    twSwitchStatus(value);
                  }),
            ),
            SettingItemWidget(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              title: 'Connect to Google+',
              titleTextStyle: primaryTextStyle(),
              onTap: () {
                googleSwitchStatus(!isGoogleSwitch);
              },
              trailing: noteSwitchWidget(
                  noteSwitchValue: isGoogleSwitch,
                  onTap: (bool value) {
                    fbSwitchStatus(value);
                  }),
            ),
            16.height,
            TMProfileComponent(),
          ],
        ),
      ),
    );
  }
}
