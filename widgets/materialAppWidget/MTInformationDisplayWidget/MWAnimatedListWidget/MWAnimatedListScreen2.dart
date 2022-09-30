import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWAnimatedListScreen2 extends StatefulWidget {
  @override
  MWAnimatedListScreen2State createState() => MWAnimatedListScreen2State();
}

class MWAnimatedListScreen2State extends State<MWAnimatedListScreen2> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<int> _items = [0];
  int counter = 0;

  Widget rotateIt(BuildContext context, int index, animation) {
    int item = _items[index];
    return RotationTransition(
      turns: animation,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: commonCacheImageWidget(
              'https://www.halfbakedharvest.com/wp-content/uploads/2020/02/Earl-Grey-Lemon-Ricotta-Pancakes-with-Salted-Maple-Butter-1-700x1050.jpg',
              200,
              width: context.width(),
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
          ),
          Positioned(
            bottom: 24,
            left: 16,
            child: Container(
              padding: EdgeInsets.only(top: 4, right: 4, left: 8, bottom: 4),
              margin: EdgeInsets.only(left: 8, top: 8),
              width: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: paleVioletRed),
              child: Text('Item $item', style: boldTextStyle(color: white, size: 14)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            height: double.infinity,
            child: AnimatedList(
              key: listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return rotateIt(context, index, animation);
              },
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: crimson.withOpacity(0.5)),
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButton(
                width: context.width() * 0.45,
                color: darkSlateBlue.withOpacity(0.7),
                onTap: () {
                  setState(() {
                    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));
                    _items = []
                      ..add(counter++)
                      ..addAll(_items);
                  });
                },
                child: Text("Add item", style: boldTextStyle(color: white)),
              ).expand(),
              16.width,
              AppButton(
                width: context.width() * 0.45,
                color: salmon,
                onTap: () {
                  if (_items.length <= 1) return;
                  listKey.currentState!.removeItem(0, (_, animation) => rotateIt(context, 0, animation), duration: Duration(milliseconds: 500));
                  setState(() {
                    _items.removeAt(0);
                  });
                },
                child: Text("Remove item", style: boldTextStyle(color: white)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
