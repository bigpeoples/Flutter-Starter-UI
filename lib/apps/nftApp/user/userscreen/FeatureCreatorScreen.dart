import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/CreatorWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/CreatorDetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

class FeatureCreatorScreen extends StatefulWidget {
  @override
  FeatureCreatorScreenState createState() => FeatureCreatorScreenState();
}

class FeatureCreatorScreenState extends State<FeatureCreatorScreen> {
  List<NftAppModel> list = getCreatorData();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    list.shuffle();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (_, index) {
        NftAppModel data = list[index];
        return Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(context, buildPageRoute(child: CreatorDetailScreen(img: data.img, img1: data.img1), pageRouteAnimation: PageRouteAnimation.Slide));
            },
            child: CreatorWidget(appModel: data),
          ),
        );
      },
    );
  }
}
