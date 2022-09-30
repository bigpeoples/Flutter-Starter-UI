import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBCategoryFragment extends StatefulWidget {
  @override
  _NBCategoryFragmentState createState() => _NBCategoryFragmentState();
}

class _NBCategoryFragmentState extends State<NBCategoryFragment> {
  List<Category> category = categoryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Categories', center: true, showBack: false, color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16),
                hintText: 'Search...',
                hintStyle: primaryTextStyle(),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: grey, width: 0.5)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: grey, width: 0.5)),
              ),
            ).paddingOnly(left: 16, right: 16, top: 16),
            16.height,
            ListView.builder(
              padding: EdgeInsets.only(bottom: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (context, index) {
                Category data = category[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.title!, style: boldTextStyle()),
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            activeColor: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            value: data.status,
                            onChanged: (value) {
                              setState(() {
                                data.status = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 16, right: 16).onTap(() {
                      setState(() {});
                      data.status = !data.status!;
                    }),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
