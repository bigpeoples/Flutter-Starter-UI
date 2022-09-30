import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWCategoryMenuListScreen2 extends StatefulWidget {
  @override
  MWCategoryMenuListScreen2State createState() => MWCategoryMenuListScreen2State();
}

class MWCategoryMenuListScreen2State extends State<MWCategoryMenuListScreen2> {
  List<String> categoryIconList = [
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category1.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category2.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category5.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category4.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category6.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category7.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category8.png',
    'images/widgets/materialWidgets/mwInformationDisplayWidgets/category/category9.png',
  ];
  List<String> categoryNameList = ['Fashion', 'Phones', 'Electronic', 'Food', 'Sport', 'health &\n care', 'Voucher Game', 'Booking'];

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
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          categoryIconList.length,
          (index) {
            return Container(
              margin: EdgeInsets.all(8),
              width: context.width() * 0.18,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(
                      border: Border.all(color: gray.withOpacity(0.7), width: 0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: commonCacheImageWidget(categoryIconList[index], 40, fit: BoxFit.cover),
                  ),
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
