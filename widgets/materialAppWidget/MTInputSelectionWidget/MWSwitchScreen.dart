import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSwitchScreen extends StatefulWidget {
  static String tag = '/MWSwitchScreen';

  @override
  MWSwitchScreenState createState() => MWSwitchScreenState();
}

class MWSwitchScreenState extends State<MWSwitchScreen> {
  bool isSwitched = false;
  var textHolder = 'OFF';

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  decoration: BoxDecoration(
                    color: appStore.cardColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: radius(defaultRadius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Default', style: appStore.isDarkModeOn ? primaryTextStyle() : primaryTextStyle()),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                            inactiveTrackColor: Color(0xFF848B9B),
                          ),
                        ],
                      ),
                      Text('Value : $isSwitched', style: primaryTextStyle(size: 16)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: appStore.cardColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: radius(defaultRadius),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Custom Colors', style: appStore.isDarkModeOn ? primaryTextStyle() : primaryTextStyle()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Switch(
                            hoverColor: Colors.red,
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.orangeAccent,
                            activeColor: Colors.orange,
                            inactiveTrackColor: Color(0xFF848B9B),
                          ),
                          Text('Value : $isSwitched', style: primaryTextStyle(size: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: appStore.cardColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: radius(defaultRadius),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: FittedBox(child: Text('Custom Image with Custom Color', style: appStore.isDarkModeOn ? primaryTextStyle() : primaryTextStyle())),
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                              inactiveThumbImage: Image.asset('images/widgets/materialWidgets/mwInputSelectionWidgets/switch/moon.png').image,
                              inactiveThumbColor: Colors.transparent,
                              inactiveTrackColor: Color(0xFF848B9B),
                              activeThumbImage: Image.asset('images/widgets/materialWidgets/mwInputSelectionWidgets/switch/sun.png').image,
                              hoverColor: Colors.red,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.orangeAccent,
                              activeColor: Colors.orange,
                            ),
                          ),
                          Text('Value : $isSwitched', style: primaryTextStyle(size: 16)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: appStore.cardColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: radius(defaultRadius),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Custom Sizes', style: appStore.isDarkModeOn ? primaryTextStyle(color: appTextColor) : primaryTextStyle()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                              inactiveTrackColor: Color(0xFF848B9B),
                            ),
                          ),
                          Transform.scale(
                            scale: 1.7,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                              inactiveTrackColor: Color(0xFF848B9B),
                            ),
                          ),
                          Transform.scale(
                            scale: 2,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                              inactiveTrackColor: Color(0xFF848B9B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
