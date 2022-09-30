import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/NFTScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class paymentDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment success', style: boldTextStyle(size: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          Image.asset('images/nft/ic_server.png', height: 100, width: 100, fit: BoxFit.cover),
          SizedBox(height: 16),
          Text('Your payment was success', style: boldTextStyle(size: 18)),
          SizedBox(height: 8),
          Text('Payment ID 15263541', style: primaryTextStyle()),
          SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(12),
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => NFTScreen()));
              },
              child: Text('Back to home', style: boldTextStyle()),
            ),
          )
        ],
      ),
    );
  }
}
