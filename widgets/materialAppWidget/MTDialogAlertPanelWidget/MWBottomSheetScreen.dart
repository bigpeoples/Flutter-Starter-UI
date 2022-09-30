import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBottomSheetScreen extends StatefulWidget {
  static String tag = '/MWBottomSheetScreen';

  @override
  MWBottomSheetScreenState createState() => MWBottomSheetScreenState();
}

class MWBottomSheetScreenState extends State<MWBottomSheetScreen> {
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
    AppModel(title: 'Simple Bottom Sheet'),
    AppModel(title: 'Bottom Sheet with rounded corner'),
    AppModel(title: 'Bottom Sheet with scrollable content'),
    AppModel(title: 'Bottom Sheet with Form'),
  ];

  @override
  Widget build(BuildContext context) {
    void mSimpleBottomSheet() {
      Widget mOption(var icon, var value) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: iconSecondaryColor),
              16.width,
              Text(value, style: primaryTextStyle(size: 16)),
            ],
          ),
        );
      }

      showModalBottomSheet(
        context: context,
        backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        builder: (builder) {
          return Container(
            height: 160.0,
            color: Colors.transparent,
            child: Column(
              children: [
                mOption(Icons.share, "Share").onTap(() {
                  finish(context);
                  toast('share');
                }),
                mOption(Icons.link, "Get Link").onTap(() {
                  finish(context);
                  toast('Get Link');
                }),
                mOption(Icons.edit, "Edit Name").onTap(() {
                  finish(context);
                  toast('Edit Name');
                }),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              mSimpleBottomSheet();
            } else if (index == 1) {
              mCornerBottomSheet(context);
            } else if (index == 2) {
              mExpandedSheet(context);
            } else if (index == 3) {
              mFormBottomSheet(context);
            }
          });
        },
      ),
    );
  }
}

mCornerBottomSheet(BuildContext aContext) {
  showModalBottomSheet(
    context: aContext,
    backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    builder: (builder) {
      return Container(
        height: 250.0,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Information", style: boldTextStyle()),
            16.height,
            Divider(height: 5, color: Color(0xFFDADADA).withOpacity(0.5)),
            16.height,
            Text("Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.", style: secondaryTextStyle()),
            8.height,
          ],
        ),
      );
    },
  );
}

mExpandedSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          child: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index', style: primaryTextStyle()),
                );
              },
              itemCount: 20,
            ),
          ),
        );
      },
    ),
  );
}

mFormBottomSheet(BuildContext aContext) {
  showModalBottomSheet(
    backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
    context: aContext,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Add Review", style: boldTextStyle()),
              Divider(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark).paddingOnly(top: 16, bottom: 16),
              Text("Email", style: primaryTextStyle()),
              8.height,
              editTextStyle("Enter Email"),
              16.height,
              Text("Description", style: primaryTextStyle()),
              8.height,
              editTextStyle("Description"),
              16.height,
              RatingBar(
                initialRating: 5,
                minRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ).center(),
              30.height,
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: boxDecoration(bgColor: appPrimaryColor, radius: 16),
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Center(
                    child: Text("Submit", style: primaryTextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Padding editTextStyle(var hintText) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: TextFormField(
      style: secondaryTextStyle(size: 16),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        hintText: hintText,
        hintStyle: primaryTextStyle(color: appStore.isDarkModeOn ? grey : grey),
        filled: true,
        fillColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: iconSecondaryColor, width: 1.0)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: iconSecondaryColor, width: 1.0)),
      ),
    ),
  );
}
