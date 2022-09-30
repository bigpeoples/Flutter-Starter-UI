import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/screens/SubKitScreen.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppCommon.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class AppItemWidget extends StatefulWidget {
  final AppModel? data;
  final int index;

  final Widget? child;
  final Widget? icon;
  final Function? onTap;

  AppItemWidget({required this.index, this.data, this.child, this.onTap, this.icon});

  @override
  AppItemWidgetState createState() => AppItemWidgetState();
}

class AppItemWidgetState extends State<AppItemWidget> {
  @override
  void dispose() {
    if (appStore.isDarkModeOn) {
      setStatusBarColor(scaffoldSecondaryDark, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isVisited = false;
    if (widget.data!.widget != null) {
      isVisited = getBoolAsync(widget.data!.widget!.toStringShort());
    }

    return SizedBox(
      width: context.width() / 2 - 24,
      child: InkWell(
        onTap: () {
          if (widget.data!.themeType == ThemeTypeComingSoon) {
            toast('Coming soon');
          } else if (widget.onTap != null) {
            widget.onTap!.call();
          } else if (widget.data!.subKit.validate().isNotEmpty) {
            SubKitScreen(widget.data).launch(context);
          } else if (widget.data!.widget != null) {
            setValue(widget.data!.widget!.toStringShort(), true);
            setState(() {});

            if (appStore.isDarkModeOn && !widget.data!.isDarkModeSupported.validate(value: true)) {
              appStore.toggleDarkMode(value: false);
            }
            if (widget.data!.themeType.validate() == ThemeTypeFullApp || widget.data!.isContainsScaffold.validate()) {
              widget.data!.widget.launch(context);
            } else {
              SafeArea(
                child: Scaffold(
                  body: AppBarScroller(child: widget.data!.widget, title: widget.data!.title, description: widget.data!.description),
                ),
              ).launch(context);
            }
          } else {
            //
          }
        },
        borderRadius: radius(defaultRadius),
        child: Observer(
          builder: (_) => Container(
            constraints: BoxConstraints(minHeight: 120),
            decoration: BoxDecoration(
              color: appStore.cardColor,
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: radius(defaultRadius),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.icon != null ? widget.icon! : Image.asset(abstractIconsList()[widget.index % abstractIconsList().length], height: 30),
                    Row(
                      children: [
                        Container(
                          child: Text(widget.data!.tag.validate().toUpperCase(), style: boldTextStyle(size: 10, color: Colors.white, letterSpacing: 1.3)),
                          decoration: BoxDecoration(color: Colors.green, borderRadius: radius(4)),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        ).visible(widget.data!.tag.validate().isNotEmpty),
                        Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: radius(4)),
                        ).visible(widget.data!.widget != null && !isVisited),
                      ],
                    ),
                  ],
                ),
                8.height,
                Text(widget.data!.title.validate(), style: boldTextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
                8.height,
                widget.child != null ? widget.child! : Text(widget.data!.description.validate(), style: secondaryTextStyle(size: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ),
      ),
    ).paddingOnly(left: 8, right: 8);
  }
}
