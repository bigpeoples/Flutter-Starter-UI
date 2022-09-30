import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

// ignore: must_be_immutable
class GSOrderProgressDetailsScreen extends StatefulWidget {
  static String tag = '/GSOrderProgressDetailsScreen';
  GSMyOrderModel? orderProgressList;

  GSOrderProgressDetailsScreen({this.orderProgressList});

  @override
  GSOrderProgressDetailsScreenState createState() => GSOrderProgressDetailsScreenState();
}

class GSOrderProgressDetailsScreenState extends State<GSOrderProgressDetailsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  Widget orderStatusWidget(OrderStatusWidget orderStatusWidget) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: true,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: gs_primary_color,
        padding: EdgeInsets.all(8),
      ),
      endChild: orderStatusWidget,
      beforeLineStyle: LineStyle(
        color: gs_primary_color,
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        elevation: 1,
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: gs_primary_color),
              onPressed: () {
                finish(context);
              },
            ),
            8.width,
            Text(widget.orderProgressList!.orderId.validate(), style: boldTextStyle()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.orderProgressList!.date!, style: primaryTextStyle()).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
            Divider(),
            Text("Order Status", style: boldTextStyle()).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
            Column(
              children: [
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                      width: 16,
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color),
                  endChild: OrderStatusWidget(title: 'Preparing order'),
                  beforeLineStyle: LineStyle(
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color,
                      thickness: 2),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  indicatorStyle: IndicatorStyle(
                      width: 16,
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color),
                  endChild: OrderStatusWidget(title: 'Ready to Collect'),
                  beforeLineStyle: LineStyle(
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color,
                      thickness: 2),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  indicatorStyle: IndicatorStyle(
                    width: 16,
                    color: (widget.orderProgressList!.orderStatus == 1)
                        ? gs_primary_color
                        : (widget.orderProgressList!.orderStatus == 2)
                            ? Colors.orangeAccent
                            : (widget.orderProgressList!.orderStatus == 0)
                                ? Colors.red
                                : Container() as Color,
                  ),
                  endChild: OrderStatusWidget(title: 'Deliver order'),
                  beforeLineStyle: LineStyle(
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color,
                      thickness: 2),
                  afterLineStyle: LineStyle(
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color,
                      thickness: 2),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isLast: true,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: (widget.orderProgressList!.orderStatus == 1)
                        ? gs_primary_color
                        : (widget.orderProgressList!.orderStatus == 2)
                            ? Colors.orangeAccent
                            : (widget.orderProgressList!.orderStatus == 0)
                                ? Colors.red
                                : Container() as Color,
                  ),
                  endChild: OrderStatusWidget(disabled: true, title: 'Ready to Collect'),
                  beforeLineStyle: LineStyle(
                      color: (widget.orderProgressList!.orderStatus == 1)
                          ? gs_primary_color
                          : (widget.orderProgressList!.orderStatus == 2)
                              ? Colors.orangeAccent
                              : (widget.orderProgressList!.orderStatus == 0)
                                  ? Colors.red
                                  : Container() as Color,
                      thickness: 2),
                ),
              ],
            ),
            Divider(),
            8.height,
            Text("Destination", style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            8.height,
            Text("8618 Hickory Avenue Newington, CT 06111", style: primaryTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
            8.height,
            Divider(),
            8.height,
            Text("Courier", style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            8.height,
            Row(
              children: [
                Image.asset(gs_app_logo, height: 40, width: 40, fit: BoxFit.cover),
                8.width,
                Text("Grocery Courier", style: primaryTextStyle(size: 14)),
              ],
            ).paddingOnly(left: 16, right: 16),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Cost", style: boldTextStyle()).paddingOnly(left: 16, right: 16),
                Text("\u00244.02", style: boldTextStyle(size: 18)).paddingOnly(left: 16, right: 16),
              ],
            ),
            8.height,
            Text("You can check your order detail here, Thank you for order.").paddingOnly(left: 16, right: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
