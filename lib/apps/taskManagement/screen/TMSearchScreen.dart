import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMSearchScreen extends StatefulWidget {
  static String tag = '/TMSearchScreen';

  @override
  TMSearchScreenState createState() => TMSearchScreenState();
}

class TMSearchScreenState extends State<TMSearchScreen> {
  List<TMCategoryModel> mCategoryList = toDoList();
  List<TMCategoryModel>? mCategorySearchList;

  TextEditingController? _textEditingController = TextEditingController();

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
  void dispose() {
    super.dispose();
    _textEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Search", elevation: 0, center: true, color: context.cardColor),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    autoFocus: true,
                    controller: _textEditingController,
                    onChanged: (value) {
                      mCategorySearchList = mCategoryList
                          .where(
                            (element) => element.title!.contains(value.capitalizeFirstLetter()),
                          )
                          .toList();
                      if (_textEditingController!.text.isNotEmpty && mCategorySearchList!.length == 0) {}
                      setState(() {});
                    },
                    decoration: TMInputDecoration(context, hintText: "Search...", borderColor: context.dividerColor).copyWith(
                      prefixIcon: Icon(Icons.search, color: grey, size: 24),
                    ),
                  ).expand(),
                ],
              ),
              16.height,
              Text('Suggested', style: boldTextStyle(size: 18)),
              16.height,
              ListView.builder(
                shrinkWrap: true,
                itemCount: _textEditingController!.text.isNotEmpty ? mCategorySearchList!.length : mCategoryList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  TMCategoryModel data = _textEditingController!.text.isNotEmpty ? mCategorySearchList![index] : mCategoryList[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(data.title.validate(), style: secondaryTextStyle(size: 16)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
