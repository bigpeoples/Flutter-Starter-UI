import 'dart:async';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class LocalNotificationScreen extends StatefulWidget {
  static String tag = '/LocalNotificationScreen';

  @override
  LocalNotificationScreenState createState() => LocalNotificationScreenState();
}

class LocalNotificationScreenState extends State<LocalNotificationScreen> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    AwesomeNotifications().initialize(
      'resource://drawable/app_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF4C76EA),
          ledColor: Colors.white,
        ),
        NotificationChannel(
          channelKey: 'grouped',
          channelName: 'grouped notifications',
          channelDescription: 'Notification channel to activate grouped',
          channelShowBadge: true,
          defaultColor: Color(0xFF4C76EA),
          ledColor: Colors.white,
        ),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: globalScaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Notification With title and subtitle", style: boldTextStyle(size: 14)),
              onTap: () {
                showBasicNotification(1);
              },
            ),
            16.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Notification With action button", style: boldTextStyle(size: 14)),
              onTap: () {
                showNotificationWithIconsAndActionButtons(3);
              },
            ),
            16.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Group Notification", style: boldTextStyle(size: 14)),
              onTap: () {
                showGroupedNotifications(12);
              },
            ),
          ],
        ).center().paddingOnly(left: 30, right: 30),
      ),
    );
  }

  Future<void> showBasicNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      title: 'Simple Notification Title',
      body: 'Simple Notification Description',
    ));
  }

  Future<void> showNotificationWithIconsAndActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: 'Flutter Notification',
        body: 'Notification with action button!',
        payload: {'uuid': 'user-profile-uuid'},
      ),
      actionButtons: [
        NotificationActionButton(key: 'READ', label: 'Mark as read', autoDismissible: true),
        NotificationActionButton(key: 'PROFILE', label: 'Profile', autoDismissible: true),
      ],
    );
  }

  Future<void> showGroupedNotifications(id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(id: 1, channelKey: 'grouped', title: 'Group Notification title', body: 'Hi'),
    );

    sleep(Duration(microseconds: 700));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(id: 2, channelKey: 'grouped', title: 'Group Notification title', body: 'How are you?'),
    );

    sleep(Duration(seconds: 3));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(id: 3, channelKey: 'grouped', title: 'Group Notification title', body: 'Hi? How are you'),
    );

    sleep(Duration(seconds: 2));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(id: 3, channelKey: 'grouped', title: 'Group Notification title', body: 'Its perfect!'),
    );
  }
}
