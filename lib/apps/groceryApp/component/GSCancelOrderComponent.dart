import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSCancelOrderComponent extends StatefulWidget {
  static String tag = '/GSCancelOrderComponent';

  @override
  GSCancelOrderComponentState createState() => GSCancelOrderComponentState();
}

class GSCancelOrderComponentState extends State<GSCancelOrderComponent> {
  int ratingNum = 0;
  List<GSMyOrderModel> cancelOrderList = getCancelOrderList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          myOrderWidget(
            ratingBar: RatingBar.builder(
              initialRating: 5,
              minRating: 0,
              itemCount: 5,
              glow: false,
              maxRating: 5,
              itemSize: 30,
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                ratingNum = rating.toInt();
                setState(() {});
              },
            ),
            orderList: getCancelOrderList(),
          ),
          cartNotFound().visible(cancelOrderList.isEmpty).paddingTop(context.height() * 0.3)
        ],
      ),
    );
  }
}
