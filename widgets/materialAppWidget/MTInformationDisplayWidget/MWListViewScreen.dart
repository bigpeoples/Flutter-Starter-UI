import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppItemWidget.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListViewScreen extends StatefulWidget {
  static String tag = '/MWListViewScreen';

  @override
  _MWListViewScreenState createState() => _MWListViewScreenState();
}

class _MWListViewScreenState extends State<MWListViewScreen> {
  var getListViewData = getListViewListWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      body: ListView.builder(
        itemCount: getListViewData.length,
        itemBuilder: (BuildContext context, index) {
          return AppItemWidget(data: getListViewData[index], onTap: () => getListViewData[index].widget.launch(context), index: index);
        },
      ),
    );
  }
}
