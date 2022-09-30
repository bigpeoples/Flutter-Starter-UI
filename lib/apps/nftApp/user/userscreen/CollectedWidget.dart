import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/CreatorWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

class CollectedWidget extends StatefulWidget {
  @override
  CollectedWidgetState createState() => CollectedWidgetState();
}

class CollectedWidgetState extends State<CollectedWidget> {
  List<NftAppModel> list = getAllCreatorData();

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
          child: CreatorWidget(appModel: data),
        );
      },
    );
  }
}
