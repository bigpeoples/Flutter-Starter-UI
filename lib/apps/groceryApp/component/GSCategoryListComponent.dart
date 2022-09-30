import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSCategoryListDetailsScreen.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class GSCategoryListComponent extends StatefulWidget {
  static String tag = '/GSCategoryListComponent';
  List<GSCategoryModel> categoryList;

  GSCategoryListComponent(this.categoryList);

  @override
  GSCategoryListComponentState createState() => GSCategoryListComponentState();
}

class GSCategoryListComponentState extends State<GSCategoryListComponent> {
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
    return Wrap(
      runSpacing: 16,
      spacing: 16,
      children: widget.categoryList.map((e) {
        return Container(
          width: context.width() * 0.27,
          padding: EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(4),
            border: Border.all(color: Colors.grey[200]!),
            backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(e.image!, fit: BoxFit.cover, height: 60, width: 60),
              8.height,
              Text(e.catgoryName!, style: primaryTextStyle(size: 12), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ).onTap(() {
          GSCategoryListDetailsScreen(categoryName: e.catgoryName).launch(context);
        });
      }).toList(),
    );
  }
}
