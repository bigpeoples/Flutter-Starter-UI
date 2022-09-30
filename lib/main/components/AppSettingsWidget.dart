import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/screens/SuggestionScreen.dart';
import 'package:mighty_ui_kit/main/services/LoginService.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppCommon.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

import '../../main.dart';
import 'AppItemWidget.dart';

class AppSettingsWidget extends StatefulWidget {
  static String tag = '/AppSettingsWidget';

  @override
  AppSettingsWidgetState createState() => AppSettingsWidgetState();
}

class AppSettingsWidgetState extends State<AppSettingsWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (_) => Wrap(
            runSpacing: 16,
            children: [
              AppItemWidget(
                index: 1,
                data: AppModel(title: 'Dark Mode'),
                icon: Icon(MaterialCommunityIcons.theme_light_dark, color: appPrimaryColor),
                child: Container(
                  child: CupertinoSwitch(
                    value: appStore.isDarkModeOn,
                    activeColor: appPrimaryColor,
                    onChanged: (v) {
                      appStore.toggleDarkMode(value: v);
                    },
                  ),
                ),
                onTap: () {
                  appStore.toggleDarkMode();
                  setState(() {});
                },
              ),
              AppItemWidget(
                index: 2,
                data: AppModel(
                  title: appStore.isLoggedIn ? getStringAsync(UserName) : 'Sign In With Google',
                  description: appStore.isLoggedIn ? 'Write Feedback/ Suggestion' : 'Sign In to give your valuable feedback',
                ),
                icon: appStore.isLoggedIn ? commonCacheImageWidget(getStringAsync(UserPhoto), 30).cornerRadiusWithClipRRect(15) : Image.asset('images/eGarden/eg_ic_google.png', height: 24),
                onTap: () async {
                  if (getBoolAsync(IsLoggedInSocialLogin)) {
                    SuggestionScreen().launch(context);
                  } else {
                    isLoading = true;
                    setState(() {});

                    await signInWithGoogle().then((value) {
                      SuggestionScreen().launch(context);
                    }).catchError((e) {
                      if (e.toString().isNotEmpty) toast(e.toString());
                    });

                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
              AppItemWidget(
                index: 3,
                data: AppModel(title: 'Documentation', description: 'Setup & Configuration'),
                icon: Icon(SimpleLineIcons.doc, color: appPrimaryColor),
                onTap: () {
                  launchURL(DocumentationUrl, forceWebView: true);
                },
              ),
              AppItemWidget(
                index: 4,
                data: AppModel(title: 'Change Log', description: 'Version History'),
                icon: Icon(MaterialCommunityIcons.history, color: appPrimaryColor),
                onTap: () {
                  launchURL(ChangeLogUrl, forceWebView: true);
                },
              ),
              AppItemWidget(
                index: 5,
                data: AppModel(title: 'Rate Us', description: 'Rate on Google Play Store'),
                icon: Icon(FontAwesome.star_o, color: appPrimaryColor),
                onTap: () {
                  PackageInfo.fromPlatform().then((value) async {
                    launchURL('$playStoreBaseURL${value.packageName}');
                  });
                },
              ),
              AppItemWidget(
                index: 6,
                data: AppModel(title: 'Share App', description: 'Share $MainAppName with your friends'),
                icon: Icon(Feather.share, color: appPrimaryColor),
                onTap: () {
                  PackageInfo.fromPlatform().then((value) async {
                    await Share.share('Download $MainAppName from Play Store\n\n\n$playStoreBaseURL${value.packageName}');
                  });
                },
              ),
              AppItemWidget(
                index: 7,
                data: AppModel(title: 'Download', description: 'Download $MainAppName Source Code'),
                icon: Icon(AntDesign.download, color: appPrimaryColor),
                onTap: () {
                  launchURL('$BuyUrl');
                },
              ),
              AppItemWidget(
                index: 8,
                data: AppModel(title: 'Our Apps', description: 'MeetMighty Portfolio'),
                icon: Icon(AntDesign.appstore_o, color: appPrimaryColor),
                onTap: () {
                  launchURL('$PortfolioUrl');
                },
              ),
              AppItemWidget(
                index: 9,
                data: AppModel(title: 'Logout', description: 'Logout from App'),
                icon: Icon(MaterialCommunityIcons.exit_to_app, color: appPrimaryColor),
                onTap: () async {
                  bool? res = await showConfirmDialog(context, 'Do you want to logout?', buttonColor: appPrimaryColor);

                  if (res ?? false) {
                    await logout();

                    setState(() {});
                  }
                },
              ).visible(getBoolAsync(IsLoggedInSocialLogin)),
            ],
          ).paddingOnly(left: 8, right: 8, bottom: 16),
        ),
        Loader().visible(isLoading),
      ],
    );
  }
}
