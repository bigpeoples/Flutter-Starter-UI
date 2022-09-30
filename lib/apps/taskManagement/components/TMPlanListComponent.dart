import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class TMPlanListComponent extends StatefulWidget {
  int? index;

  TMPlanListComponent({this.index});

  @override
  _TMPlanListComponentState createState() => _TMPlanListComponentState();
}

class _TMPlanListComponentState extends State<TMPlanListComponent> {
  List<TMCategoryModel> mPlanList = tmGetCategoryList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: radius(24),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            mPlanList[widget.index!].color1!,
            mPlanList[widget.index!].color2!,
          ],
        ),
      ),
      child: Text(mPlanList[widget.index!].title.validate(), style: primaryTextStyle(color: white)).center(),
    );
  }
}
