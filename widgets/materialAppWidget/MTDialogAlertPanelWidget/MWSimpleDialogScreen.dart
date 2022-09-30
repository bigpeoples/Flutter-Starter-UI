import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSimpleDialogScreen extends StatefulWidget {
  static String tag = '/MWSimpleDialogScreen';

  @override
  MWSimpleDialogScreenState createState() => MWSimpleDialogScreenState();
}

class MWSimpleDialogScreenState extends State<MWSimpleDialogScreen> {
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

  List<AppModel> example = [
    AppModel(title: 'Simple Dialog'),
    AppModel(title: 'Custom Achievement'),
    AppModel(title: 'Custom Warning Dialog'),
    AppModel(title: 'Image Dialog'),
    AppModel(title: 'Dialog with TextField'),
    AppModel(title: 'Custom Delete Dialog'),
    AppModel(title: 'Account Selection Dialog'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              showDialog(
                context: context,
                builder: (BuildContext context) => SimpleDialogExample(),
              );
            } else if (index == 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialogExample(),
              );
            } else if (index == 2) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomWarning(),
              );
            } else if (index == 3) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomImage(),
              );
            } else if (index == 4) {
              showDialog(
                context: context,
                builder: (BuildContext context) => FormDialogExample(),
              );
            } else if (index == 5) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDelete(),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomAccount(),
              );
            }
          });
        },
      ),
    );
  }
}

class CustomDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              ),
            ),
            Image(image: AssetImage('images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widgettrophy.png'), height: 80, fit: BoxFit.cover),
            24.height,
            Text('Congratulations', style: boldTextStyle(size: 24)),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle()),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}

class SimpleDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
      titlePadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      title: Text('Message', style: appStore.isDarkModeOn ? boldTextStyle(size: 20) : boldTextStyle(size: 20)),
      children: [
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle()),
      ],
    );
  }
}

class FormDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              ),
            ),
            Text('Contact', style: boldTextStyle(size: 20)),
            16.height,
            TextFormField(
              cursorColor: textPrimaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                hintText: 'Enter Contact Number',
                hintStyle: secondaryTextStyle(color: textSecondaryColor, size: 16),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: textPrimaryColor, width: 0.0)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: textPrimaryColor, width: 0.0)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: primaryTextStyle(color: textPrimaryColor),
            ),
            30.height,
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: boxDecoration(bgColor: Colors.indigo, radius: 10),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Center(
                  child: Text("Apply", style: boldTextStyle(color: white)),
                ),
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 150, color: Colors.indigo),
                Column(
                  children: [
                    Image(image: AssetImage('images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widget_no_wifi.png'), height: 50, color: white, fit: BoxFit.cover),
                    16.height,
                    Text('No Internet Connection', textAlign: TextAlign.center, style: boldTextStyle(size: 18, color: white)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(padding: const EdgeInsets.only(left: 16, right: 16), child: Text("Please check your internet connection nd try again.", style: secondaryTextStyle())),
            16.height,
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                decoration: boxDecoration(bgColor: Colors.indigo, radius: 30),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text('Retry', style: boldTextStyle(color: white)),
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            ClipRRect(child: Image.asset('images/widgets/materialWidgets/mwDialogAlertPanelWidgets/widget_food.jpg', fit: BoxFit.cover, height: 250), borderRadius: BorderRadius.circular(8)),
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(padding: EdgeInsets.all(16), child: Icon(Icons.close, color: black)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: commonCacheImageWidget('$BaseUrl/mwDialogAlertPanelWidgets/widget_delete.jpg', 120, width: context.width(), fit: BoxFit.cover),
            ),
            24.height,
            Text('Delete folder?', style: boldTextStyle(size: 18)),
            16.height,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text("This will also permanently delete file inside the folder", style: secondaryTextStyle()),
            ),
            16.height,
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecoration(color: Colors.blueAccent, radius: 8, bgColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.close, color: Colors.blueAccent, size: 18))),
                              TextSpan(text: "Cancel", style: TextStyle(fontSize: 16.0, color: Colors.blueAccent)),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      finish(context);
                    }),
                  ),
                  16.width,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecoration(bgColor: Colors.blueAccent, radius: 8),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.delete, color: Colors.white, size: 18))),
                              TextSpan(text: "Delete", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      toast("Successfully Deleted");
                      finish(context);
                    }),
                  )
                ],
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

class CustomAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: new BoxDecoration(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    finish(context);
                  },
                  child: Icon(Icons.close, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                ),
                16.width,
                Text('Account', style: boldTextStyle(size: 20), textAlign: TextAlign.center)
              ],
            ),
            30.height,
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('images/widgets/materialWidgets/mwDialogAlertPanelWidgets/ic_user.jpg'),
                ),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Smith", style: primaryTextStyle(size: 20)),
                    FittedBox(child: Text("Johnsmith@gmail.com", style: secondaryTextStyle(size: 20))),
                  ],
                ).expand()
              ],
            ),
            20.height,
            Center(
              child: Container(
                decoration: boxDecoration(
                  radius: 20,
                  color: Theme.of(context).dividerColor,
                  bgColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
                ),
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Text("Manage your account", style: primaryTextStyle(size: 20)),
              ),
            ),
            20.height,
            Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
            20.height,
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 16.0), child: Icon(Icons.settings, color: iconSecondaryColor, size: 18))),
                  TextSpan(text: "Photo Settings", style: secondaryTextStyle(size: 16)),
                ],
              ),
            ),
            20.height,
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(child: Padding(padding: EdgeInsets.only(right: 16.0), child: Icon(Icons.help_outline, color: iconSecondaryColor, size: 18))),
                  TextSpan(text: "Help and feedback", style: secondaryTextStyle(size: 16)),
                ],
              ),
            ),
            20.height,
            Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Privacy", style: secondaryTextStyle()),
                Container(decoration: BoxDecoration(shape: BoxShape.circle, color: textSecondaryColor), width: 4, height: 4, margin: EdgeInsets.only(left: 8, right: 8)),
                Text("Terms", style: secondaryTextStyle()),
                Container(decoration: BoxDecoration(shape: BoxShape.circle, color: textSecondaryColor), width: 4, height: 4, margin: EdgeInsets.only(left: 8, right: 8)),
                Text("Policy", style: secondaryTextStyle())
              ],
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
