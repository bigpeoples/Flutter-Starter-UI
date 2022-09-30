import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/components/TMTimeZoneComponent.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMTimeZoneScreen extends StatefulWidget {
  String? title;

  TMTimeZoneScreen({this.title});

  @override
  TMTimeZoneScreenState createState() => TMTimeZoneScreenState();
}

class TMTimeZoneScreenState extends State<TMTimeZoneScreen> {
  List<TMCategoryModel> timeZoneList = tmTimeZoneList();
  int selectedIndex = 0;
  String? title = '';
  int dataIndex = 0;
  TMCategoryModel data = TMCategoryModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    title = widget.title;
    dataIndex = timeZoneList.indexOf(data, title.toInt());
    timeZoneList.forEach((element) {
      if (element.title == title) {
        selectedIndex = timeZoneList.indexOf(element);
      }
    });
  }

  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Time Zone', center: true, elevation: 0, titleTextStyle: boldTextStyle(), color: context.cardColor),
      body: Container(
        child: Column(
          children: [
            TMTimeZoneComponent(),
            ListView.builder(
              itemCount: timeZoneList.length,
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                TMCategoryModel data = timeZoneList[index];
                bool isSelectedIndex = selectedIndex == index;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data.title.validate(), style: boldTextStyle()),
                        6.height,
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(data.subTitle.validate(), style: secondaryTextStyle()),
                              decoration: boxDecorationDefault(
                                color: context.cardColor,
                                border: Border.all(color: context.dividerColor),
                                boxShadow: defaultBoxShadow(blurRadius: 0, spreadRadius: 0),
                              ),
                            ),
                            8.width,
                            Text('14 years ahead', style: secondaryTextStyle()),
                          ],
                        ),
                      ],
                    ),
                    noteCheckWidget(context, checkIconColor: isSelectedIndex ? white : checkColor, color: isSelectedIndex ? tmSecondaryColor : context.cardColor),
                  ],
                ).paddingAll(16).onTap(
                  () {
                    selectedIndex = index;
                    setState(() {});
                    TMCategoryModel data1 = TMCategoryModel(title: data.title);
                  },
                );
              },
            ).expand()
          ],
        ),
      ),
    );
  }
}
