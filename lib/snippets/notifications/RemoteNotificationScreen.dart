import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class RemoteNotificationScreen extends StatefulWidget {
  static String tag = '/RemoteNotificationScreen';

  @override
  RemoteNotificationScreenState createState() => RemoteNotificationScreenState();
}

class RemoteNotificationScreenState extends State<RemoteNotificationScreen> {
  String debugLabelString = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppButton(
          color: appStore.cardColor,
          height: 40,
          width: context.width(),
          shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
          child: Text("Remote Notification", style: boldTextStyle(size: 14)),
          onTap: () async {
            handleSendNotification();
          },
        ).center().paddingOnly(left: 20, right: 20),
      ),
    );
  }

  void handleSendNotification() async {
    var status = await (OneSignal.shared.getDeviceState());
    // var playerId = status.subscriptionStatus.userId;
    var playerId = status!.userId;
    var imgUrlString = "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg";

    var notification = OSCreateNotification(
      playerIds: [playerId!],
      content: "This is a test from OneSignal's Notifications",
      heading: "Test Notification",
      iosAttachments: {"id1": imgUrlString},
      bigPicture: imgUrlString,
      buttons: [
        OSActionButton(text: "test1", id: "id1"),
        OSActionButton(text: "test2", id: "id2"),
      ],
    );

    var response = await OneSignal.shared.postNotification(notification);
    this.setState(() {
      debugLabelString = "Sent notification with response: $response";
    });
  }
}
