import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGFilterScreen extends StatefulWidget {
  const YGFilterScreen({Key? key}) : super(key: key);

  @override
  _YGFilterScreenState createState() => _YGFilterScreenState();
}

class _YGFilterScreenState extends State<YGFilterScreen> {
  bool like = false;
  bool isLike = false;

  @override
  void initState() {
    super.initState();
  }

  Widget filterWidgets({required List list}) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: List.generate(
        list.length,
        (index) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 8),
            height: 35,
            decoration: BoxDecoration(
              color: list[index].isLike ? Colors.white : yg_primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 3)],
            ),
            child: Text(list[index].text, textAlign: TextAlign.center, style: TextStyle(color: list[index].isLike ? Colors.black : Colors.white)),
          ).onTap(() {
            list[index].isLike = !list[index].isLike;
            setState(() {});
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Filter',
        center: true,
        color: context.scaffoldBackgroundColor,
        backWidget: Icon(
          Icons.clear_sharp,
          color: context.iconColor,
        ).onTap(() {
          finish(context);
        }),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text('Type', style: boldTextStyle()),
            8.height,
            filterWidgets(list: typeList),
            16.height,
            Text('Level', style: boldTextStyle()),
            8.height,
            filterWidgets(list: levelList),
            16.height,
            Text('Duration', style: boldTextStyle()),
            8.height,
            filterWidgets(list: durationList),
            16.height,
            Text('Focus', style: boldTextStyle()),
            8.height,
            filterWidgets(list: focusList),
            16.height,
            Text('Body Part', style: boldTextStyle()),
            8.height,
            filterWidgets(list: bodyPartList)
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.all(8),
            width: context.width() * .40,
            decoration: boxDecorationRoundedWithShadow(20, backgroundColor: yg_primaryColor),
            padding: EdgeInsets.all(8),
            child: Text('RESET', style: primaryTextStyle(color: Colors.white)).center(),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.all(8),
            width: context.width() * .40,
            decoration: boxDecorationRoundedWithShadow(20, backgroundColor: like ? Colors.white : yg_primaryColor),
            padding: EdgeInsets.all(8),
            child: Text('DONE', style: primaryTextStyle(color: like ? yg_primaryColor : Colors.white)).center(),
          )
        ],
      ).paddingAll(8),
    );
  }
}
