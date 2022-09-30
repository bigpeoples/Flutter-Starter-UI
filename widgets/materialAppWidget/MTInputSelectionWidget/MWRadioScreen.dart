import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWRadioScreen extends StatefulWidget {
  static String tag = '/MWRadioScreen';

  @override
  MWRadioScreenState createState() => MWRadioScreenState();
}

class MWRadioScreenState extends State<MWRadioScreen> {
  var gender;
  var gender1;

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
                child: Text('Simple Radio Button', style: boldTextStyle(size: 18)),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                    child: Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Male', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                    ),
                    child: Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Female', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                    child: Radio(
                      value: 'Transgender',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Transgender', style: primaryTextStyle()),
                ],
              ),
              8.height,
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Radio Button Tile', style: boldTextStyle(size: 18)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                  child: RadioListTile(
                      title: Text(
                        'Radio Button Tile',
                        style: appStore.isDarkModeOn ? boldTextStyle() : boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Simple Radio button tile with title and subtitle',
                        style: appStore.isDarkModeOn ? secondaryTextStyle() : secondaryTextStyle(),
                      ),
                      value: 'Radio button tile',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          toast("$gender1 Selected");
                        });
                      }),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        'Radio Button Tile',
                        style: appStore.isDarkModeOn ? boldTextStyle() : boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Radio Button on the trailing side',
                        style: appStore.isDarkModeOn ? secondaryTextStyle() : secondaryTextStyle(),
                      ),
                      value: 'Radio Button on the trailing side',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          toast("Radio Button on the trailing side");
                        });
                      }),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            'images/widgets/materialWidgets/mwInputSelectionWidgets/Checkbox/ic_profile.png',
                          ).image),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        'Radio Button Tile',
                        style: appStore.isDarkModeOn ? boldTextStyle() : boldTextStyle(),
                      ),
                      subtitle: Text(
                        'Radio Button Tile with leading and trailing side.',
                        style: appStore.isDarkModeOn ? secondaryTextStyle() : secondaryTextStyle(),
                      ),
                      value: 'Female',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
