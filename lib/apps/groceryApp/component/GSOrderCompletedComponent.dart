import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSOrderCompletedComponent extends StatefulWidget {
  static String tag = '/GSOrderCompletedComponent';

  @override
  GSOrderCompletedComponentState createState() => GSOrderCompletedComponentState();
}

class GSOrderCompletedComponentState extends State<GSOrderCompletedComponent> {
  int ratingNum = 0;
  List<GSMyOrderModel> completedOrderList = getOnCompletedList();

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
            orderList: completedOrderList,
            onTap: () {},
          ),
          cartNotFound().visible(completedOrderList.isEmpty).paddingTop(context.height() * 0.3)
        ],
      ),
    );
  }
}
