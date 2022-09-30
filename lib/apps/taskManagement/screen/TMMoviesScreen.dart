import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMMoviesScreen extends StatefulWidget {
  const TMMoviesScreen({Key? key}) : super(key: key);

  @override
  _TMMoviesScreenState createState() => _TMMoviesScreenState();
}

class _TMMoviesScreenState extends State<TMMoviesScreen> {
  List<TMCategoryModel> upCommingList = toMoviesList();
  List<TMCategoryModel> finishedList = toFinishedList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Movies', center: true, elevation: 0, color: context.cardColor),
      body: Container(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UpComing', style: boldTextStyle()),
              8.height,
              ListView.builder(
                itemCount: upCommingList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  TMCategoryModel data = upCommingList[index];
                  return SettingItemWidget(
                    padding: EdgeInsets.all(12),
                    title: data.title.validate(),
                    onTap: () {
                      data.isCheckList = !data.isCheckList!;
                      setState(() {});
                    },
                    leading: noteCheckWidget(
                      context,
                      color: data.isCheckList! ? tmSecondaryColor : context.cardColor,
                      checkIconColor: data.isCheckList! ? white : checkColor,
                      onTap: () {
                        data.isCheckList = !data.isCheckList!;
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
              16.height,
              Text('Finished', style: boldTextStyle()),
              ListView.builder(
                shrinkWrap: true,
                itemCount: finishedList.length,
                itemBuilder: (BuildContext context, int index) {
                  TMCategoryModel data = finishedList[index];
                  return Row(
                    children: [
                      noteCheckWidget(
                        context,
                        color: data.isCheckList! ? tmSecondaryColor : context.cardColor,
                        checkIconColor: data.isCheckList! ? white : checkColor,
                        onTap: () {
                          data.isCheckList = !data.isCheckList!;
                          setState(() {});
                        },
                      ),
                      16.width,
                      Text(data.title.validate(), style: secondaryTextStyle(size: 16, decoration: TextDecoration.lineThrough))
                    ],
                  ).paddingAll(8);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
