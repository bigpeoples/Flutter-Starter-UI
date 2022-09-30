import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWAnimatedListScreen1 extends StatefulWidget {
  @override
  MWAnimatedListScreen1State createState() => MWAnimatedListScreen1State();
}

class MWAnimatedListScreen1State extends State<MWAnimatedListScreen1> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<String> _items = ['Item 1'];

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
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mediumPurple,
        child: Icon(Icons.add, color: white),
        onPressed: () {
          _addItem();
        },
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 70,
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(blurRadius: 0.2, spreadRadius: 1.0, color: gray.withOpacity(0.5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                commonCacheImageWidget('https://randomuser.me/api/portraits/men/41.jpg', 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                16.width,
                Column(
                  children: [
                    Text(item, style: boldTextStyle()),
                    4.height,
                    Text('Hello', style: secondaryTextStyle()),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.close, color: tomato),
              onPressed: () {
                _removeItem(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removeItem(int i) {
    String removeItem = _items.removeAt(i);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removeItem, animation, i);
    };
    listKey.currentState!.removeItem(i, builder);
  }

  void _addItem() {
    int i = _items.length > 0 ? _items.length : 0;
    _items.insert(i, 'Item ${_items.length + 1}');
    listKey.currentState!.insertItem(i);
  }
}
