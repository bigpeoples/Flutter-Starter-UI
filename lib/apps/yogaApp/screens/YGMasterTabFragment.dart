import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGCourseWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGProgramWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGMasterTabFragment extends StatefulWidget {
  const YGMasterTabFragment({Key? key}) : super(key: key);

  @override
  _YGMasterTabFragmentState createState() => _YGMasterTabFragmentState();
}

class _YGMasterTabFragmentState extends State<YGMasterTabFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Popular Courses', style: boldTextStyle(size: 18)).paddingAll(16),
          YGCoursesWidgetComponent(list: trainingTabList),
          Text('Program Master', style: boldTextStyle(size: 18)).paddingAll(16),
          YGProgramWidgetComponent(list: trainingFragmentList),
        ],
      ),
    );
  }
}
