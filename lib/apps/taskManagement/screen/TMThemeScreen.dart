import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMThemeScreen extends StatefulWidget {
  String? title;

  TMThemeScreen({this.title});

  @override
  TMThemeScreenState createState() => TMThemeScreenState();
}

class TMThemeScreenState extends State<TMThemeScreen> {
  List<TMCategoryModel> themeList = tmThemeList();
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
    dataIndex = themeList.indexOf(data, title.toInt());
    themeList.forEach(
      (element) {
        if (element.title == title) {
          selectedIndex = themeList.indexOf(element);
        }
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Themes', titleTextStyle: boldTextStyle(), center: true, elevation: 0, color: context.cardColor),
      body: ListView.builder(
        itemCount: themeList.length,
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          TMCategoryModel data1 = themeList[index];
          bool isMyIndex = selectedIndex == index;
          dataIndex = index;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data1.title.validate(), style: boldTextStyle()),
              8.height,
              Container(
                child: Stack(
                  children: [
                    Container(height: 100, width: context.width(), decoration: boxDecorationDefault(color: context.cardColor)),
                    Container(
                      height: 30,
                      width: context.width() * 0.98,
                      decoration: boxDecorationDefault(
                        gradient: LinearGradient(
                          colors: [data1.color1!, data1.color2!],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 48,
                      right: 16,
                      child: noteCheckWidget(
                        context,
                        checkIconColor: isMyIndex ? white : checkColor,
                        color: isMyIndex ? tmSecondaryColor : context.cardColor,
                      ),
                    ),
                  ],
                ),
              ).onTap(
                () {
                  selectedIndex = index;
                  setState(() {});

                  TMCategoryModel data = TMCategoryModel(title: data1.title.validate());
                  finish(context, data);
                },
              )
            ],
          ).paddingAll(6);
        },
      ),
    );
  }
}
