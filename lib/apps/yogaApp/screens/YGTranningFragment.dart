import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGBeginnerTabFragment.dart';
import 'YGMasterTabFragment.dart';
import 'YGSkilledTabFragment.dart';

class YGTrainingFragment extends StatefulWidget {
  const YGTrainingFragment({Key? key}) : super(key: key);

  @override
  _YGTrainingFragmentState createState() => _YGTrainingFragmentState();
}

class _YGTrainingFragmentState extends State<YGTrainingFragment> {
  int currentPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: currentPosition,
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          title: Text('Training', style: boldTextStyle(color: yg_primaryColor, size: 22)),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: appStore.isDarkModeOn ? yg_primaryColor : Colors.black,
            labelColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
            labelStyle: boldTextStyle(),
            tabs: [
              Tab(text: 'Master'),
              Tab(text: 'Skilled'),
              Tab(text: 'Beginner'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            YGMasterTabFragment(),
            YGSkilledTabFragment(),
            YGBeginnerTabFragment(),
          ],
        ),
      ),
    );
  }
}
