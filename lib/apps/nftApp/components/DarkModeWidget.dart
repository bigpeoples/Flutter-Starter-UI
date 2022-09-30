import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class DarkModeWidget extends StatefulWidget {
  @override
  DarkModeWidgetState createState() => DarkModeWidgetState();
}

class DarkModeWidgetState extends State<DarkModeWidget> {
  bool mIsCheck = false;

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
    return SwitchListTile(
      activeTrackColor: nftPrimaryColor,
      activeColor: nftPrimaryColor,
      secondary: Image.asset('images/nft/ic_mode.png', height: 20, width: 20, color: Theme.of(context).iconTheme.color),
      title: Text('Dark Mode', style: primaryTextStyle()),
      dense: true,
      value: mIsCheck,
      onChanged: (val) {
        mIsCheck = val;
        setState(() {});
      },
    );
  }
}
