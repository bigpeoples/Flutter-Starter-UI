import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class CreatorWidget extends StatefulWidget {
  final NftAppModel appModel;

  CreatorWidget({required this.appModel});

  @override
  CreatorWidgetState createState() => CreatorWidgetState();
}

class CreatorWidgetState extends State<CreatorWidget> {
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
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 260,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.appModel.img!, height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(widget.appModel.img1!, height: 120, width: 120, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 8),
                      Text(widget.appModel.title!, style: boldTextStyle(size: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(widget.appModel.description!, style: primaryTextStyle()),
          SizedBox(height: 8),
          Row(
            children: [
              Text(widget.appModel.subTitle!, style: boldTextStyle(size: 22)),
              SizedBox(width: 8),
              Expanded(
                child: Text('Followers', style: secondaryTextStyle()),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Theme.of(context).cardColor, side: BorderSide(color: Colors.grey)),
                onPressed: () {
                  widget.appModel.isCheck = !widget.appModel.isCheck;
                  setState(() {});
                },
                child: Text(widget.appModel.isCheck ? 'Unfollow' : 'Follow', style: boldTextStyle()),
              )
            ],
          )
        ],
      ),
    );
  }
}
