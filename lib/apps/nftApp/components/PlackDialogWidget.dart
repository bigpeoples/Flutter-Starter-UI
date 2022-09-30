import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/WalletAlertDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class PlackDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Place a bid', style: boldTextStyle()),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          Text('You must bid at least 0.825 ETH', style: secondaryTextStyle()),
          SizedBox(height: 16),
          Text('Your bid', style: boldTextStyle()),
          SizedBox(height: 16),
          checkDialog(title: 'Enter bid', subTitle: 'ETH'),
          SizedBox(height: 16),
          checkDialog(title: 'Your balance', subTitle: '8.498 ETH'),
          SizedBox(height: 16),
          checkDialog(title: 'Service fee', subTitle: '0 ETH'),
          SizedBox(height: 16),
          checkDialog(title: 'Total', subTitle: '0.007 ETH'),
          SizedBox(height: 16),
          AppButton(
            title: 'Place a bid',
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) {
                  return WalletAlertDialogWidget();
                },
              );
            },
          ),
          SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: boldTextStyle()),
            ),
          )
        ],
      ),
    );
  }
}
