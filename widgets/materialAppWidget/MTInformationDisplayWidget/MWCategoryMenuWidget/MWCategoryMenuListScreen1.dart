import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWCategoryMenuListScreen1 extends StatefulWidget {
  @override
  MWCategoryMenuListScreen1State createState() => MWCategoryMenuListScreen1State();
}

class MWCategoryMenuListScreen1State extends State<MWCategoryMenuListScreen1> {
  List<String> categoryIconList = [
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category3.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category2.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category5.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category4.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category6.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category7.png',
  ];
  List<String> categoryNameList = ['Fashion', 'Phones', 'Electronic', 'Food', 'Sport', 'health &\n care'];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: 4.0,
        runSpacing: 8.0,
        children: List.generate(
          categoryNameList.length,
          (index) {
            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 125,
              width: context.width() * 0.28,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(spreadRadius: 0.3, blurRadius: 1.0, color: gray.withOpacity(0.5))],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  commonCacheImageWidget(categoryIconList[index], 50, fit: BoxFit.cover),
                  8.height,
                  Text(categoryNameList[index], style: secondaryTextStyle()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
