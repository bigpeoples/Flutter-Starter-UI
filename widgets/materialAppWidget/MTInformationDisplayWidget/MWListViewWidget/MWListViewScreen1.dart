import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListViewScreen1 extends StatefulWidget {
  static const tag = '/MWListViewScreen1';

  @override
  _MWListViewScreen1State createState() => _MWListViewScreen1State();
}

class _MWListViewScreen1State extends State<MWListViewScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              return DataList(dataList[index], index);
            }),
      ),
    );
  }
}

class DataList extends StatelessWidget {
  final DataModel model;
  final int pos;

  DataList(this.model, this.pos);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: appStore.cardColor),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Image.asset(model.images, height: 40, width: 40),
          16.width,
          Text(model.name, style: boldTextStyle(), maxLines: 1),
        ],
      ),
    );
  }
}

class DataModel {
  var images;
  var name;

  DataModel({
    this.images,
    this.name,
  });
}

List<DataModel> dataList = [
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travels',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/fa_food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/graphic.png',
    name: 'Business',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/healthy.png',
    name: 'Yoga & Gym',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/heart.png',
    name: 'Health',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/fa_food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/fa_food.png',
    name: 'Food',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/graphic.png',
    name: 'Business',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/healthy.png',
    name: 'Yoga & Gym',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/heart.png',
    name: 'Health',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/airplane.png',
    name: 'Travel',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/book.png',
    name: 'Education',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/computer.png',
    name: 'Management',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/finance.png',
    name: 'Finance',
  ),
  DataModel(
    images: 'images/widgets/materialWidgets/mwInformationDisplayWidgets/listView/fa_food.png',
    name: 'Food',
  ),
];
