import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSearchScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMHistoryScreen extends StatefulWidget {
  static String tag = '/TMHistoryScreen';

  @override
  TMHistoryScreenState createState() => TMHistoryScreenState();
}

class TMHistoryScreenState extends State<TMHistoryScreen> {
  List<TMCategoryModel> historyList = toHistoryList();

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
      appBar: appBarWidget(
        'History',
        center: true,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 16),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              TMSearchScreen().launch(context);
            },
            child: noteSearchIcon(context, searchImage: 'images/toDoList/tm_searchIcon.png').paddingOnly(right: 16),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          TMCategoryModel data = historyList[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title.validate(), style: boldTextStyle(size: 16)).paddingSymmetric(horizontal: 16),
              12.height,
              ListView.builder(
                itemCount: data.sublist!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  bool tisCheck = data.sublist![index].tIsCheck!;
                  return SettingItemWidget(
                    title: data.sublist![index].title.validate(),
                    titleTextStyle: secondaryTextStyle(decoration: TextDecoration.lineThrough),
                    leading: noteCheckWidget(
                      context,
                      color: tisCheck ? tmSecondaryColor : context.cardColor,
                      checkIconColor: tisCheck ? white : checkColor,
                      onTap: () {
                        tisCheck = !tisCheck;
                        setState(() {});
                      },
                    ),
                    trailing: Row(
                      children: [Text(data.sublist![index].description.validate(), style: secondaryTextStyle(size: 12)), 8.width, Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12)],
                    ),
                    onTap: () {
                      data.sublist![index].tIsCheck = !data.sublist![index].tIsCheck.validate();
                      setState(() {});
                    },
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
