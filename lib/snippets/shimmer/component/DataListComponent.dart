import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/snippets/model/SNModel.dart';
import 'package:mighty_ui_kit/snippets/utills/SNDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class DataListComponent extends StatefulWidget {
  static String tag = '/DataList';
  final Timer timer;

  DataListComponent(this.timer);

  @override
  DataListComponentState createState() => DataListComponentState();
}

class DataListComponentState extends State<DataListComponent> {
  List<SNShimmerDataListModel> getDataList = getShimmerDataList();

  double containerWidth = 280;
  double containerHeight = 15;

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
    widget.timer.cancel();
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: getDataList.length,
      itemBuilder: (context, index) {
        SNShimmerDataListModel mData = getDataList[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: 80, width: 80, child: Image.asset(mData.image!)),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: containerHeight,
                    width: containerWidth,
                    child: Text(mData.title!, style: boldTextStyle(size: 14)),
                  ),
                  5.height,
                  Container(
                    height: containerHeight,
                    width: containerWidth,
                    child: Text(mData.description!, style: primaryTextStyle(size: 12)),
                  ),
                  5.height,
                  Container(
                    height: containerHeight,
                    width: containerWidth * 0.75,
                    child: Text("\$${mData.price}", style: secondaryTextStyle()),
                  )
                ],
              ).expand()
            ],
          ),
        );
      },
    ).paddingAll(16);
  }
}
