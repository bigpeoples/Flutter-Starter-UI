import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGProgramWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';

class YGBeginnerTabFragment extends StatefulWidget {
  const YGBeginnerTabFragment({Key? key}) : super(key: key);

  @override
  _YGBeginnerTabFragmentState createState() => _YGBeginnerTabFragmentState();
}

class _YGBeginnerTabFragmentState extends State<YGBeginnerTabFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: YGProgramWidgetComponent(list: trainingFragmentList),
      ),
    );
  }
}
