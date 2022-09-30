import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListComponent extends StatelessWidget {
  final double containerWidth = 280;
  final double containerHeight = 15;

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[600]!,
          child: shimmerLayout(),
          period: Duration(milliseconds: time),
        );
      },
    ).paddingAll(16);
  }

  Widget shimmerLayout() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(height: 80, width: 80, color: Colors.grey),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: containerHeight, width: containerWidth, color: Colors.grey),
              5.height,
              Container(height: containerHeight, width: containerWidth, color: Colors.grey),
              5.height,
              Container(height: containerHeight, width: containerWidth * 0.75, color: Colors.grey)
            ],
          ).expand()
        ],
      ),
    );
  }
}
