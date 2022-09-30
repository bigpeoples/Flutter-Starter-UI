import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/CreatorDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/UserDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../main.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  ChoiceScreenState createState() => ChoiceScreenState();
}

class ChoiceScreenState extends State<ChoiceScreen> {
  List<String> choice = ['For User', 'For Creator'];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      appBar: appBar(isBack: true),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: choice.map((e) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (choice.indexOf(e) == 0) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UserDashBoardScreen()));
                } else if (choice.indexOf(e) == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CreatorDashBoardScreen()));
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2 - 24,
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(16), color: Theme.of(context).cardColor),
                child: Column(
                  children: [
                    Icon(Icons.perm_identity, size: 50, color: Theme.of(context).iconTheme.color),
                    SizedBox(height: 16),
                    Text(e, style: boldTextStyle(size: 18)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
