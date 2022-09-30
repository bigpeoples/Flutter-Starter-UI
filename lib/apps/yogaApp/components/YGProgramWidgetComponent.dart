import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class YGProgramWidgetComponent extends StatelessWidget {
  final List? list;

  YGProgramWidgetComponent({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
              padding: EdgeInsets.all(8),
              height: 130,
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Align(alignment: Alignment.bottomRight, child: Image.asset(list![index].url, fit: BoxFit.fitHeight).cornerRadiusWithClipRRect(8)),
            ),
            Positioned(top: 50, left: 28, child: Text(list![index].subtitle, style: boldTextStyle())),
            Positioned(bottom: 50, left: 28, child: Text(list![index].text, style: secondaryTextStyle(color: Colors.red))),
          ],
        );
      },
    );
  }
}
