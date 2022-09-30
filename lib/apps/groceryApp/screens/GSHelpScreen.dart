import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GSHelpScreen extends StatefulWidget {
  static String tag = '/GSHelpScreen';

  @override
  GSHelpScreenState createState() => GSHelpScreenState();
}

class GSHelpScreenState extends State<GSHelpScreen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        elevation: 1,
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: gs_primary_color),
              onPressed: () {
                finish(context);
              },
            ),
            8.width,
            Text("Help", style: boldTextStyle()).expand(),
          ],
        ),
      ),
      body: Column(
        children: [
          helpWidget("Grocery Care", gs_headphone),
          Divider(),
          helpWidget("Terms and condition", gs_next_icon),
          Divider(),
          helpWidget("Privacy", gs_next_icon),
        ],
      ),
    );
  }
}
