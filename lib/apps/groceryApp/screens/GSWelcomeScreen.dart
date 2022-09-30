import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSLoginScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSRegisterScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSConstants.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class GSWelcomeScreen extends StatefulWidget {
  static String tag = '/GSWelcomeScreen';

  @override
  GSWelcomeScreenState createState() => GSWelcomeScreenState();
}

class GSWelcomeScreenState extends State<GSWelcomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : gs_primary_color, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? Colors.transparent : Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : gs_primary_color,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(gs_app_logo_white, height: 80, width: 80, fit: BoxFit.cover),
                ),
                8.height,
                Text(GSAppName, style: boldTextStyle(size: 24, color: Colors.white)),
              ],
            ).paddingBottom(context.height() * 0.4),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topLeft: 16, topRight: 16),
                  backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome", style: boldTextStyle(size: 22)),
                    8.height,
                    Text("If you are already have  Grocery account, enter your email below", style: secondaryTextStyle()),
                    16.height,
                    gsAppButton(context, "Continue with email", () {
                      finish(context);
                      GSLoginScreen().launch(context);
                    }),
                    16.height,
                    AppButton(
                      width: context.width(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonCacheImageWidget(gs_apple_icon, 24, width: 24),
                          8.width,
                          Text("Sign in with Apple", style: boldTextStyle(color: Colors.white)),
                        ],
                      ),
                      color: Colors.black,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                      onTap: () {},
                    ),
                    16.height,
                    AppButton(
                      color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                      elevation: 0,
                      width: context.width(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(gs_google_icon, height: 24, width: 24),
                          8.width,
                          Text("Sign in with Google", style: boldTextStyle()),
                        ],
                      ),
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      onTap: () {},
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: secondaryTextStyle()),
                        3.width,
                        Text("Register", style: secondaryTextStyle(color: gs_primary_color)),
                      ],
                    ).onTap(() {
                      GSRegisterScreen().launch(context);
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
