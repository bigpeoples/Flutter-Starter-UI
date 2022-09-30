import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TMSetGoalScreen extends StatefulWidget {
  static String tag = '/TMSetGoalScreen';

  @override
  TMSetGoalScreenState createState() => TMSetGoalScreenState();
}

class TMSetGoalScreenState extends State<TMSetGoalScreen> {
  bool _switchOn = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  void switchStatus(bool value) {
    _switchOn = value;
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
        'Set Goals',
        color: appStore.isDarkModeOn ? context.cardColor : white,
        center: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SettingItemWidget(
            title: 'Evaluate Performance',
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            leading: noteLeadingWidget(context, image: "images/toDoList/tm_meter.png"),
            onTap: () {
              switchStatus(!_switchOn);
            },
            trailing: noteSwitchWidget(
              noteSwitchValue: _switchOn,
              onTap: (bool value) {
                switchStatus(value);
              },
            ),
          ),
          SettingItemWidget(
            title: 'Daily Tasks',
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            leading: noteLeadingWidget(context, image: "images/toDoList/tm_list.png"),
            trailing: Row(
              children: [
                Text('10', style: secondaryTextStyle(size: 14)),
                8.width,
                Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
              ],
            ),
          ),
          SettingItemWidget(
            title: 'Working days',
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            leading: noteLeadingWidget(context, image: "images/toDoList/tm_calender.png"),
            trailing: Row(
              children: [
                Text('Mon,Tue,Wed,Thur,Fri,Sat,Sun', style: secondaryTextStyle(size: 14)),
                8.width,
                Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
              ],
            ),
          ),
        ],
      ).paddingAll(8),
    );
  }
}
