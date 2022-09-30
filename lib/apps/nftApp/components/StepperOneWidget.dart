import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../main.dart';


class StepperOneWidget extends StatefulWidget {
  @override
  StepperOneWidgetState createState() => StepperOneWidgetState();
}

class StepperOneWidgetState extends State<StepperOneWidget> {
  List<String> bankList = ['Bank wallet', 'Coin wallet', 'Wallet connect'];
  int currentIndex = 0;

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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 8),
      shrinkWrap: true,
      itemCount: bankList.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? scaffoldSecondaryDark : containerBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: appStore.isDarkModeOn && currentIndex == index
                      ? Colors.white
                      : currentIndex == index
                          ? nftPrimaryColor
                          : Colors.grey.withOpacity(0.1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.add, size: 24),
                  ),
                  Text(bankList[index], style: boldTextStyle(size: 18))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
