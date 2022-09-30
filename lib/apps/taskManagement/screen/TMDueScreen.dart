import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMDueScreen extends StatefulWidget {
  static String tag = '/TMDueScreen';

  @override
  TMDueScreenState createState() => TMDueScreenState();
}

class TMDueScreenState extends State<TMDueScreen> {
  List<TMCategoryModel> duesList = toDuesList();

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
      appBar: appBarWidget("Due's", elevation: 0, center: true, color: context.cardColor),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: duesList.length,
        itemBuilder: (_, index) {
          TMCategoryModel data = duesList[index];
          return SettingItemWidget(
            title: data.title.validate(),
            onTap: () {
              data.isCheckList = !data.isCheckList!;
              setState(() {});
            },
            leading: noteCheckWidget(
              context,
              color: data.isCheckList! ? tmSecondaryColor : context.cardColor,
              checkIconColor: data.isCheckList! ? white : checkColor,
              onTap: () {
                data.isCheckList = !data.isCheckList!;
                setState(() {});
              },
            ),
            trailing: Row(
              children: [Text(data.date.validate(), style: secondaryTextStyle(size: 14, color: Colors.pink)), 8.width, Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12)],
            ),
          );
        },
      ),
    );
  }
}
