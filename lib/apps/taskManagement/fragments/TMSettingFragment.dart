import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMLanguageScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMProfileScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSetGoalScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMThemeScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMTimeZoneScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMSettingFragment extends StatefulWidget {
  const TMSettingFragment({Key? key}) : super(key: key);

  @override
  _TMSettingFragmentState createState() => _TMSettingFragmentState();
}

class _TMSettingFragmentState extends State<TMSettingFragment> {
  bool isSync = false;
  bool isVacationMode = false;
  String title = '';
  String timeZone = '';
  TMNotesModel notesData = TMNotesModel();
  String themeTitle = '';
  int selectedIndex = 0;
  TMCategoryModel data1 = TMCategoryModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  void sync(bool value) {
    isSync = value;
    setState(() {});
  }

  void mode(bool value) {
    isVacationMode = value;
    setState(() {});
  }

  Future<void> init() async {
    //
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          '',
          color: context.cardColor,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                TMProfileScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
              },
              child: Container(
                padding: EdgeInsets.all(22),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: Image.asset('images/toDoList/profile.png').image,
                  ),
                ),
              ),
            ),
          ],
          backWidget: Icon(Entypo.list, color: context.iconColor),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 40, left: 0, right: 0, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('General', style: boldTextStyle(size: 18)).paddingLeft(16),
              8.height,
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                title: 'Sync Automatically',
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_sync.png"),
                onTap: () {
                  sync(!isSync);
                },
                trailing: noteSwitchWidget(
                  noteSwitchValue: isSync,
                  onTap: (bool value) {
                    sync(value);
                  },
                ),
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                title: 'Language',
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_language.png"),
                trailing: Row(
                  children: [
                    Text(title, style: secondaryTextStyle(size: 14)),
                    8.width,
                    Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
                  ],
                ),
                onTap: () async {
                  TMCategoryModel? data = await TMLanguageScreen(
                    title: title,
                  ).launch(context);
                  title = data!.title.validate();
                  setState(() {});
                },
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                title: 'Theme',
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_devices.png", color: tmPrimaryColor),
                trailing: Row(
                  children: [
                    Text(themeTitle, style: secondaryTextStyle(size: 14)),
                    8.width,
                    Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
                  ],
                ),
                onTap: () async {
                  TMCategoryModel data = await TMThemeScreen(
                    title: themeTitle,
                  ).launch(context);
                  themeTitle = data.title.validate();
                  setState(() {});
                },
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                onTap: () {
                  mode(!isVacationMode);
                },
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_bagpack.png", color: tmPrimaryColor),
                title: 'Vacation Mode',
                trailing: noteSwitchWidget(
                  noteSwitchValue: isVacationMode,
                  onTap: (bool value) {
                    mode(value);
                  },
                ),
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                title: 'Time Zone',
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_clock.png", color: tmPrimaryColor),
                trailing: Row(
                  children: [
                    Text(timeZone, style: secondaryTextStyle(size: 14)),
                    8.width,
                    Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
                  ],
                ),
                onTap: () async {
                  TMCategoryModel data = await TMTimeZoneScreen(
                    title: timeZone,
                  ).launch(context);
                  timeZone = data.title.validate();
                  setState(() {});
                  log(timeZone.toString());
                },
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_notification.png"),
                title: 'Show Notification',
                onTap: () {
                  toast("tapped");
                },
              ),
              8.height,
              Text('Productivity', style: boldTextStyle(size: 18)).paddingLeft(16),
              8.height,
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_setgoal.png"),
                title: 'Set Goal',
                onTap: () {
                  TMSetGoalScreen().launch(context);
                },
              ),
              SettingItemWidget(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                title: 'Delete Account',
                leading: noteLeadingWidget(context, image: "images/toDoList/tm_delete.png"),
                onTap: () {
                  showConfirmDialogCustom(
                    context,
                    title: "Do you want to add this item?",
                    dialogType: DialogType.DELETE,
                    onAccept: (contexts) {
                      TMDashBoardScreen().launch(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
