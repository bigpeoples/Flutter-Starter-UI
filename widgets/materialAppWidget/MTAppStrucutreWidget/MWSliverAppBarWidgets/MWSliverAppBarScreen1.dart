import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSliverAppBarScreen1 extends StatelessWidget {
  static String tag = '/MWSliverAppBarScreen1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              /*   leading: IconButton(
                icon: Icon(Icons.filter_1),
                color: appStore.isDarkModeOn
                    ? iconColorPrimaryDark
                    : innerBoxIsScrolled
                        ? blackColor
                        : white,
                onPressed: () {
                  // Do something
                },
              ),*/
              expandedHeight: 220.0,
              floating: true,
              pinned: false,
              snap: false,
              elevation: 50,
              backgroundColor: appBarBackgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('SliverAppBar with ListView', style: primaryTextStyle(color: innerBoxIsScrolled ? textPrimaryColor : white)),
                  background: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: 'https://images.hdqwalls.com/download/beautiful-sunset-jo-2560x1440.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item ${index.toString()}',
                    style: primaryTextStyle(size: 20),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
