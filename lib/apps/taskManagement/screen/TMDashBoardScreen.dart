import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/fragments/TMCalenderFragment.dart';
import 'package:mighty_ui_kit/apps/taskManagement/fragments/TMHomeFragment.dart';
import 'package:mighty_ui_kit/apps/taskManagement/fragments/TMProgressFragment.dart';
import 'package:mighty_ui_kit/apps/taskManagement/fragments/TMSettingFragment.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/WalkthorughModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMAddNoteScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TMDashBoardScreen extends StatefulWidget {
  static String tag = '/TMDashBoardScreen';

  @override
  TMDashBoardScreenState createState() => TMDashBoardScreenState();
}

class TMDashBoardScreenState extends State<TMDashBoardScreen> {
  int selectedIndex = 0;

  List<WalkthorughModel> navigationData = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    navigationData.add(WalkthorughModel(iconData: Icons.home, value: TMHomeFragment()));
    navigationData.add(WalkthorughModel(iconData: Icons.bar_chart_sharp, value: TMProgressFragment()));
    navigationData.add(WalkthorughModel(iconData: Icons.calendar_today, value: TMCalenderFragment()));
    navigationData.add(WalkthorughModel(iconData: Icons.settings, value: TMSettingFragment()));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Container(
            height: 60,
            width: 60,
            child: Icon(Icons.add, color: Colors.white),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [tmSecondaryColor, tmPrimaryColor],
              ),
            ),
          ),
          onPressed: () async {
            TMAddNoteScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
          },
          backgroundColor: tmSecondaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              navigationData.length,
              (index) {
                return IconButton(
                  icon: Icon(navigationData[index].iconData, color: selectedIndex == index ? tmPrimaryColor : context.iconColor, size: 24),
                  onPressed: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: navigationData[selectedIndex].value,
    );
  }
}
