import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/paymentDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class followStepWidget extends StatelessWidget {
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
              Text('Follow Steps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          Image.asset('images/ic_security.png', height: 100, width: 100, fit: BoxFit.cover),
          SizedBox(height: 16),
          Text('Purchasing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 8),
          Text('Your payment is processing', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
          SizedBox(height: 16),
          AppButton(
            title: 'Processing',
            onTap: () {
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
              style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
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
