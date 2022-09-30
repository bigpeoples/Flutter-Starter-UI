import 'package:flutter/material.dart';

import 'MWListViewScreen1.dart';

class MWListViewScreen4 extends StatefulWidget {
  static const tag = '/MWListViewScreen4';

  @override
  _MWListViewScreen4State createState() => _MWListViewScreen4State();
}

class _MWListViewScreen4State extends State<MWListViewScreen4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: dataList.length,
            padding: EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              return DataList(dataList[index], index);
            }),
      ),
    );
  }
}
