import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/paymentDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class AlertDialogWidget extends StatelessWidget {
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
              Text('Checkout', style: boldTextStyle(size: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          SizedBox(height: 16),
          Text('Your payment:', style: primaryTextStyle()),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1.005', style: boldTextStyle()),
              Text('ETH', style: boldTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey),
          checkDialog(title: 'Your balance', subTitle: '8.498 ETH'),
          SizedBox(height: 16),
          checkDialog(title: 'Service fee', subTitle: '0 ETH'),
          SizedBox(height: 16),
          checkDialog(title: 'You will pay', subTitle: '0.007 ETH'),
          SizedBox(height: 16),
          AppButton(
            title: 'Check out',
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) {
                  return paymentDialogWidget();
                },
              );
            },
          ),
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
              },
              child: Text('Cancel', style: boldTextStyle()),
            ),
          )
        ],
      ),
    );
  }
}
