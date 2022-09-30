import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWAppBarScreen extends StatefulWidget {
  static String tag = '/MWAppBarScreen';

  @override
  MWAppBarScreenState createState() => MWAppBarScreenState();
}

class MWAppBarScreenState extends State<MWAppBarScreen> {
  FocusNode focusNode = FocusNode();

  Widget appBarTitle = Text("Search Toolbar", style: boldTextStyle());

  Icon actionIcon = Icon(Icons.search, color: Colors.white);

  //
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget() {
      return BackButton(
        color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
        onPressed: () {
          toast('Back button');
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 16,
              spacing: 8,
              direction: Axis.horizontal,
              children: [
                // Simple AppBar without actions and back button
                AppBar(
                  title: Text('Without Back Button & Actions', style: boldTextStyle()),
                  backgroundColor: appStore.cardColor,
                  automaticallyImplyLeading: false,
                ),
                AppBar(
                  title: Text('Center Title', style: boldTextStyle()),
                  iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                  // Center the title in AppBar with setting center title property to true.
                  centerTitle: true,
                  backgroundColor: appStore.cardColor,
                  leading: leadingWidget(),
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Back Button', style: boldTextStyle()),
                  backgroundColor: appStore.cardColor,
                ),
                AppBar(
                  title: Text('With Single Action', style: boldTextStyle()),
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                      onPressed: () {
                        toast('Settings');
                      },
                    )
                  ],
                  backgroundColor: appStore.cardColor,
                ),
                AppBar(
                  title: appBarTitle,
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(actionIcon.icon, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                      onPressed: () {
                        if (this.actionIcon.icon == Icons.search) {
                          this.actionIcon = Icon(Icons.close, color: textPrimaryColor);
                          this.appBarTitle = TextField(
                            focusNode: focusNode,
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: TextStyle(color: textPrimaryColor, fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                              hintText: "Search",
                              hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          );
                          setState(() {});
                        } else {
                          setState(() {
                            this.actionIcon = Icon(Icons.search, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark);
                            this.appBarTitle = Text("Search Toolbar", style: boldTextStyle());
                          });
                        }
                        FocusScope.of(context).requestFocus(focusNode);
                      },
                    ),
                  ],
                  backgroundColor: appStore.cardColor,
                ),
                AppBar(
                  backgroundColor: appStore.cardColor,
                  leading: IconButton(
                    icon: Icon(Icons.menu, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                    onPressed: () {
                      toast('Drawer');
                    },
                  ),
                  title: Text('Page Title', style: boldTextStyle()),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.share, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                      onPressed: () {
                        toast('Share');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                      onPressed: () {
                        toast('Search');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                      onPressed: () {
                        toast('Menu');
                      },
                    ),
                  ],
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Custom Image', style: boldTextStyle()),
                  backgroundColor: appStore.cardColor,
                  actions: [
                    IconButton(
                      onPressed: () {
                        toast('Profile');
                      },
                      icon: Image.network('https://tecake.com/wp-content/uploads/2018/07/student-profile-gabriela-mills-college.jpg').cornerRadiusWithClipRRect(20),
                    )
                  ],
                ),
                /*Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.red,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: AppBar(
                    leading: leadingWidget(),
                    centerTitle: true,
                    title: Text("Gradient Color"),
                    backgroundColor: transparentColor,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
