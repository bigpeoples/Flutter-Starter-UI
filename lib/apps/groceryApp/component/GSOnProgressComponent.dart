import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSOnProgressComponent extends StatefulWidget {
  static String tag = '/GSOnProgressComponent';

  @override
  GSOnProgressComponentState createState() => GSOnProgressComponentState();
}

class GSOnProgressComponentState extends State<GSOnProgressComponent> {
  int ratingNum = 0;
  List<GSMyOrderModel> onProgressOrderList = getOnProgressList();

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
    return SingleChildScrollView(
      child: Column(
        children: [
          myOrderWidget(ratingBar: Container(), orderList: onProgressOrderList),
          cartNotFound().visible(onProgressOrderList.isEmpty).paddingTop(context.height() * 0.3),
        ],
      ),
    );
  }
}
