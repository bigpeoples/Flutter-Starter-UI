import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/CreatorWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

class CreatedWidget extends StatefulWidget {
  @override
  CreatedWidgetState createState() => CreatedWidgetState();
}

class CreatedWidgetState extends State<CreatedWidget> {
  List<NftAppModel> list = getCreatorData();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
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
