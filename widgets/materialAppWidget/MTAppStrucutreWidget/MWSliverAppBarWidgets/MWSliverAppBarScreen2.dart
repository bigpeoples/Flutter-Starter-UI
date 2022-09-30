import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSliverAppBarScreen2 extends StatelessWidget {
  static String tag = '/MWSliverAppBarScreen2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: "https://images.hdqwalls.com/download/beautiful-sunset-jo-2560x1440.jpg",
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.parallax,
                title: Text(
                  'Parallax SliverAppBar',
                  style: boldTextStyle(color: appTextColorSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).visible(innerBoxIsScrolled),
              ),
              backgroundColor: appBarBackgroundColor,
              leading: SizedBox(),
            ),
          ];
        }),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(lipsum.createText(numParagraphs: 8, numSentences: 5), textAlign: TextAlign.justify, style: primaryTextStyle()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
