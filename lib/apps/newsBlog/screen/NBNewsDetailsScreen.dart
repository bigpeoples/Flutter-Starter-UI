import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBNewsDetailsScreen extends StatefulWidget {
  final NewsModel? data;

  NBNewsDetailsScreen({this.data});

  @override
  NBNewsDetailsScreenState createState() => NBNewsDetailsScreenState();
}

class NBNewsDetailsScreenState extends State<NBNewsDetailsScreen> {
  bool mISCheck = false;
  String mText = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    mText = lipsum.createText(numParagraphs: 4, numSentences: 4);
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
              floating: true,
              stretch: true,
              expandedHeight: context.height() * 0.6,
              pinned: true,
              iconTheme: IconThemeData(
                color: appStore.isDarkModeOn
                    ? white
                    : innerBoxIsScrolled
                        ? black
                        : white,
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.data!.title.validate(), style: boldTextStyle(size: 20)).visible(innerBoxIsScrolled),
                background: commonCachedNetworkImage(
                  widget.data!.img!.validate(),
                  width: context.width(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data!.subTitle!.validate(), style: boldTextStyle()).expand(),
                  IconButton(
                    onPressed: () {
                      mISCheck = !mISCheck;
                      setState(() {});
                    },
                    icon: Icon(mISCheck ? FontAwesome.bookmark_o : FontAwesome.bookmark, size: 32),
                  )
                ],
              ),
              Row(
                children: [
                  Text(widget.data!.type!, style: boldTextStyle(color: primaryColor)),
                  8.width,
                  Icon(Icons.circle, size: 5, color: grey),
                  8.width,
                  Text(widget.data!.timeAgo!, style: secondaryTextStyle()).expand(),
                  PopupMenuButton(
                    onSelected: choiceAction,
                    icon: Icon(AntDesign.ellipsis1),
                    itemBuilder: (BuildContext context) {
                      return PopUp.choices.map((String choice) {
                        return PopupMenuItem(value: choice, child: Text(choice));
                      }).toList();
                    },
                  ),
                ],
              ),
              16.height,
              Text(mText, style: primaryTextStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
