import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBPopularCategories extends StatefulWidget {
  @override
  _NBPopularCategoriesState createState() => _NBPopularCategoriesState();
}

class _NBPopularCategoriesState extends State<NBPopularCategories> {
  List<Category> categoryPopular = categoryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Popular Categories', titleTextStyle: boldTextStyle(),color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...categoryPopular.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title!, style: primaryTextStyle()).paddingOnly(left: 16,top: 16,bottom: 16),
                  Divider(color: grey, height: 2),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
