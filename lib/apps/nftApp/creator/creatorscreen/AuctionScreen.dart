import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/NFTScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';

class AuctionScreen extends StatefulWidget {
  @override
  AuctionScreenState createState() => AuctionScreenState();
}

class AuctionScreenState extends State<AuctionScreen> {
  TextEditingController startDataController = TextEditingController();
  TextEditingController endDataController = TextEditingController();

  DateTime? currentDate;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2050),
        builder: (BuildContext context, Widget? child) {
          return Theme(data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(), child: child!);
        });
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        startDataController.text = DateFormat.yMMMd().format(currentDate!);
      });
  }

  Future<void> endDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2050),
        builder: (BuildContext context, Widget? child) {
          return Theme(data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(), child: child!);
        });
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        endDataController.text = DateFormat.yMMMd().format(currentDate!);
      });
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
          Text('Minimum bid', style: boldTextStyle(size: 22)),
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
          Text('Starting Date', style: primaryTextStyle()),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              style: primaryTextStyle(),
              controller: startDataController,
              readOnly: true,
              textAlign: TextAlign.left,
              onTap: () {
                selectDate(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
                hintText: 'Select date',
                hintStyle: primaryTextStyle(),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Expiration Date', style: primaryTextStyle()),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              style: primaryTextStyle(),
              controller: endDataController,
              textAlign: TextAlign.left,
              readOnly: true,
              onTap: () {
                endDate(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
                hintText: '3 days',
                hintStyle: primaryTextStyle(),
              ),
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
