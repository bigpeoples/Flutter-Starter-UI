import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionScreen extends StatefulWidget {
  static String tag = '/QuickActionScreen';

  @override
  QuickActionScreenState createState() => QuickActionScreenState();
}

class QuickActionScreenState extends State<QuickActionScreen> {
  QuickActions quickActions = QuickActions();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'On home screen, long press the app icon to '
                'get Quick Action options. Tapping on that action should  '
                'set the toolbar title.',
                style: secondaryTextStyle(size: 14),
                textAlign: TextAlign.center),
            20.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Set item", style: boldTextStyle(size: 14)),
              onTap: () {
                setupQuickActions();
                handleQuickActions();
                toast("Set Item");
              },
            ),
            16.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Remove set Item", style: boldTextStyle(size: 14)),
              onTap: () {
                quickActions.clearShortcutItems();
                toast("Remove item");
              },
            ),
          ],
        ).visible(isAndroid, defaultWidget: Text('Platform Not Supported', style: boldTextStyle()).center()),
      ),
    );
  }

  void setupQuickActions() {
    quickActions.setShortcutItems(
      <ShortcutItem>[
        ShortcutItem(type: 'action_setting', localizedTitle: 'Setting'),
        ShortcutItem(type: 'action_help', localizedTitle: 'Help'),
      ],
    );
  }

  void handleQuickActions() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_setting') {
        toast("activity setting");
      } else if (shortcutType == 'action_help') {
        toast('activity help');
      }
    });
  }
}
