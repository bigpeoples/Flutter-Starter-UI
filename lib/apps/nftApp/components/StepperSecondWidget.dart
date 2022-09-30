import 'package:flutter/material.dart';

class StepperSecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('images/nft/ic_scan.jpg',height: 300,width: 300,fit: BoxFit.cover),
        SizedBox(height: 16),
        Text('Scan to connect wallet',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18)),
        SizedBox(height: 16),
      ],
    );
  }
}
