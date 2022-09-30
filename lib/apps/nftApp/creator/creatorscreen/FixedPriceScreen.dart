import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/NFTScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';

class FixedPriceScreen extends StatefulWidget {
  @override
  FixedPriceScreenState createState() => FixedPriceScreenState();
}

class FixedPriceScreenState extends State<FixedPriceScreen> {
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Fixed price', style: boldTextStyle(size: 22)),
          SizedBox(height: 8),
          Text('you receive bids on this item', style: boldTextStyle()),
          SizedBox(height: 16),
          Row(
            children: [
              Text('ETH', style: boldTextStyle(size: 22)),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  cursorColor: Theme.of(context).iconTheme.color,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    suffixIcon: Icon(Icons.close, color: Theme.of(context).iconTheme.color),
                    hintText: '0.00',
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey),
          SizedBox(height: 8),
          Theme(
            data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
            child: SwitchListTile(
              activeTrackColor: nftPrimaryColor,
              activeColor: nftPrimaryColor,
              title: Text('Unlock once purchased', style: boldTextStyle()),
              contentPadding: EdgeInsets.zero,
              subtitle: Text('Content will be Unlock after successful transaction', style: primaryTextStyle()),
              value: mIsCheck,
              onChanged: (value) {
                mIsCheck = !mIsCheck;
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 16),
          AppButton(
            title: 'Mint NFT',
            onTap: () {
              hideKeyword(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => NFTScreen()));
            },
          )
        ],
      ),
    );
  }
}
