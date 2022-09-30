import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWCheckboxScreen extends StatefulWidget {
  static String tag = '/MWCheckboxScreen';

  @override
  MWCheckboxScreenState createState() => MWCheckboxScreenState();
}

class MWCheckboxScreenState extends State<MWCheckboxScreen> {
  bool? isChecked1 = false;
  bool isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = true;
  bool? isChecked5 = true;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool? isChecked9 = false;
  bool? isChecked10 = false;
  bool? isChecked11 = false;
  bool? isChecked12 = false;

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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    child: Checkbox(
                      activeColor: Colors.grey,
                      value: isChecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked1 = value;
                        });
                      },
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: null,
                      onChanged: (checked) {},
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: true, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    child: Checkbox(
                      value: isChecked3, // unchecked
                      onChanged: (checked) {
                        setState(() {
                          isChecked3 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    child: Checkbox(
                      value: isChecked4, // selected
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked4 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    child: Checkbox(
                      value: isChecked5, // control status value
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked5 = checked;
                        });
                      },
                      tristate: true,
                      activeColor: appPrimaryColor,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text('Custom Shape Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                      ),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked6,
                        onChanged: (state) {
                          setState(() {
                            isChecked6 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appPrimaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                      ),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked7,
                        onChanged: (state) {
                          setState(() {
                            isChecked7 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appPrimaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                      ),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked8,
                        onChanged: (state) {
                          setState(() {
                            isChecked8 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appPrimaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Checkbox Tile', style: boldTextStyle(size: 18)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 10),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                  // boxShadow: defaultBoxShadow(),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                  ),
                  child: CheckboxListTile(
                    checkColor: appBarBackgroundColor,
                    value: isChecked10,
                    onChanged: (checked) {
                      setState(() {
                        isChecked10 = checked;
                      });
                    },
                    title: Text(
                      'Checkbox Tile',
                      style: appStore.isDarkModeOn ? boldTextStyle(size: 18) : boldTextStyle(size: 18),
                    ),
                    subtitle: Text(
                      'Check box with title and subtitle',
                      style: secondaryTextStyle(),
                      // style: appStore.isDarkModeOn ? secondaryTextStyle(color: appTextColor) : secondaryTextStyle(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                  // boxShadow: defaultBoxShadow(),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                  ),
                  child: CheckboxListTile(
                    checkColor: appBarBackgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: Icon(
                      Icons.subscriptions,
                      color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    value: isChecked11,
                    onChanged: (checked) {
                      setState(() {
                        isChecked11 = checked;
                      });
                    },
                    title: Text(
                      'Checkbox Tile',
                      //style: boldTextStyle(size: 18),
                      style: appStore.isDarkModeOn ? boldTextStyle(size: 18) : boldTextStyle(size: 18),
                    ),
                    subtitle: Text(
                      'Custom Trailing value',
                      //style: secondaryTextStyle(),
                      style: secondaryTextStyle(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                  // boxShadow: defaultBoxShadow(),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                  child: CheckboxListTile(
                    value: isChecked12,
                    checkColor: appBarBackgroundColor,
                    secondary: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(
                          'images/widgets/materialWidgets/mwInputSelectionWidgets/Checkbox/ic_profile.png',
                        ).image),
                        shape: BoxShape.circle,
                      ),
                    ),
                    onChanged: (checked) {
                      setState(() {
                        isChecked12 = checked;
                      });
                    },
                    title: Text(
                      'Checkbox Tile',
                      style: appStore.isDarkModeOn ? boldTextStyle(size: 18) : boldTextStyle(size: 18),
                    ),
                    subtitle: Text(
                      'Custom Leading value ',
                      style: secondaryTextStyle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
