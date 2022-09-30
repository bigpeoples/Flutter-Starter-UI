import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMLanguageScreen extends StatefulWidget {
  String? title;

  TMLanguageScreen({this.title});

  @override
  _TMLanguageScreenState createState() => _TMLanguageScreenState();
}

class _TMLanguageScreenState extends State<TMLanguageScreen> {
  List<TMCategoryModel> languageList = tmSelectLanguageList();
  List<TMCategoryModel>? languageSearchList;
  int selectedIndex = 0;
  TextEditingController languageListController = TextEditingController();
  TMCategoryModel data = TMCategoryModel();

  String languageTitle = '';
  int dataIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    languageTitle = widget.title!;
    dataIndex = languageList.indexOf(data, languageTitle.toInt());
    languageList.forEach(
      (element) {
        if (element.title == languageTitle) {
          selectedIndex = languageList.indexOf(element);
        }
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Select a Language',
        titleTextStyle: boldTextStyle(),
        center: true,
        color: context.cardColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: languageListController,
              textFieldType: TextFieldType.NAME,
              decoration: TMInputDecoration(context, hintText: "Search", borderColor: context.dividerColor),
              onChanged: (value) {
                languageSearchList = languageList
                    .where(
                      (element) => element.title!.contains(value.capitalizeFirstLetter()),
                    )
                    .toList();
                if (languageListController.text.isNotEmpty && languageSearchList!.length == 0) {}
                setState(() {});
              },
            ).paddingAll(16),
            ListView.builder(
              itemCount: languageListController.text.isNotEmpty ? languageSearchList!.length : languageList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                TMCategoryModel data1 = languageListController.text.isNotEmpty ? languageSearchList![index] : languageList[index];
                bool isMYIndex = selectedIndex == index;
                dataIndex = index;

                return SettingItemWidget(
                  title: data1.title.validate(),
                  leading: noteCheckWidget(
                    context,
                    color: isMYIndex ? tmSecondaryColor : context.cardColor,
                    checkIconColor: isMYIndex ? white : checkColor,
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                  ),
                  onTap: () {
                    setState(
                      () {
                        selectedIndex = index;
                        TMCategoryModel data = TMCategoryModel(title: data1.title.validate());
                        finish(context, data);
                      },
                    );
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
