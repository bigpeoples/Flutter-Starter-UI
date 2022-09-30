import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CWTextFieldScreen extends StatefulWidget {
  static String tag = '/CWTextFieldScreen';

  @override
  CWTextFieldScreenState createState() => CWTextFieldScreenState();
}

class CWTextFieldScreenState extends State<CWTextFieldScreen> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Default TextField', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                decoration: BoxDecoration(color: appStore.cardColor, border: Border.all(width: 1, color: Theme.of(context).dividerColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                style: primaryTextStyle(),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                padding: EdgeInsets.only(left: 4, right: 4, top: 12, bottom: 12),
              ),
              12.height,
              Text('TextField with PlaceHolder', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                decoration: BoxDecoration(color: appStore.cardColor, border: Border.all(width: 1, color: Theme.of(context).dividerColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                placeholder: 'Please enter text here',
                style: primaryTextStyle(),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                placeholderStyle: secondaryTextStyle(color: grey, size: 18),
                padding: EdgeInsets.all(12),
              ),
              12.height,
              Text('TextField with Prefix Widget', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                decoration: BoxDecoration(color: appStore.cardColor, border: Border.all(width: 1, color: Theme.of(context).dividerColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                placeholder: 'Please enter email here',
                placeholderStyle: secondaryTextStyle(color: grey, size: 18),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                prefix: Icon(Icons.email, color: iconSecondaryColor).paddingOnly(left: 4, right: 4),
                padding: EdgeInsets.all(12),
                style: primaryTextStyle(),
              ),
              12.height,
              Text('TextField with Suffix Widget', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                decoration: BoxDecoration(color: appStore.cardColor, border: Border.all(width: 1, color: Theme.of(context).dividerColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                placeholder: 'Please enter password here',
                placeholderStyle: secondaryTextStyle(color: grey, size: 18),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                autocorrect: true,
                obscureText: isVisible,
                style: primaryTextStyle(),
                suffix: Icon(isVisible ? Icons.visibility_off : Icons.visibility, color: iconSecondaryColor).paddingOnly(left: 4, right: 8).onTap(() {
                  isVisible = !isVisible;
                  setState(() {});
                }),
                padding: EdgeInsets.all(12),
              ),
              12.height,
              Text('TextField with Background color', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                placeholder: 'Please enter text here',
                placeholderStyle: secondaryTextStyle(color: white.withOpacity(0.7), size: 18),
                style: primaryTextStyle(),
                cursorColor: white,
                decoration: BoxDecoration(
                  color: getColorFromHex('#8998FF'),
                ),
                padding: EdgeInsets.all(12),
              ),
              12.height,
              Text('TextField with Border', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                placeholder: 'Please enter text here',
                placeholderStyle: primaryTextStyle(),
                style: primaryTextStyle(),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                decoration: BoxDecoration(border: Border.all(width: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark), borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: EdgeInsets.all(12),
              ),
              12.height,
              Text('TextField with circular Border', style: boldTextStyle()),
              12.height,
              CupertinoTextField(
                placeholder: 'Please enter text here',
                placeholderStyle: primaryTextStyle(),
                style: primaryTextStyle(),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                decoration: BoxDecoration(border: Border.all(width: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark), borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.all(12),
              ),
              12.height
            ],
          ).paddingOnly(left: 12, right: 12, top: 12),
        ),
      ),
    );
  }
}
