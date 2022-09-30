import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSCancelOrderComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSOnProgressComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSOrderCompletedComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GSMyOrderScreen extends StatefulWidget {
  static String tag = '/GSMyOrderScreen';

  @override
  GSMyOrderScreenState createState() => GSMyOrderScreenState();
}

class GSMyOrderScreenState extends State<GSMyOrderScreen> with SingleTickerProviderStateMixin {
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
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : gs_background,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text("My Order", style: boldTextStyle()),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: Material(
                color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                child: TabBar(
                  indicatorColor: gs_primary_color,
                  unselectedLabelColor: Colors.grey,
                  labelColor: gs_primary_color,
                  tabs: [
                    Tab(text: "Completed"),
                    Tab(text: "Delivering"),
                    Tab(text: "Canceled"),
                  ],
                ),
              ),
            ),
            Container(
              child: TabBarView(
                children: [
                  Container(child: GSOrderCompletedComponent()),
                  Container(child: GSOnProgressComponent()),
                  Container(child: GSCancelOrderComponent()),
                ],
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}
