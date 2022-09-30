import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListViewScreen3 extends StatefulWidget {
  static const tag = '/MWListViewScreen3';

  @override
  _MWListViewScreen3State createState() => _MWListViewScreen3State();
}

class _MWListViewScreen3State extends State<MWListViewScreen3> {
  late List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text("Product", style: appStore.isDarkModeOn ? boldTextStyle(color: Colors.white) : boldTextStyle(color: textPrimaryColor, size: 18)).paddingLeft(16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mListing.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return Product(mListing[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final ItemModel model;
  final int pos;

  Product(this.model, this.pos);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: commonCacheImageWidget(
              model.img,
              170,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: appStore.isDarkModeOn ? primaryTextStyle(color: Colors.white) : primaryTextStyle(color: textPrimaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  var name = "";
  var img = "";
}

List<ItemModel> getData() {
  List<ItemModel> popularArrayList = [];
  ItemModel item1 = ItemModel();
  item1.img = 'https://i.pinimg.com/originals/56/7f/d4/567fd4b1e0dfeea29becaafb8082280b.jpg';
  item1.name = "Black Jacket";

  ItemModel item2 = ItemModel();
  item2.img = 'https://5.imimg.com/data5/BO/TO/MY-34122381/img-20171006-wa0178-500x500.jpg';
  item2.name = "Denim Jacket";

  ItemModel item3 = ItemModel();
  item3.img = 'https://5.imimg.com/data5/XU/AH/MY-32275747/corporate-uniform-500x500.jpg';
  item3.name = "Blazer";

  ItemModel item4 = ItemModel();
  item4.img = 'https://5.imimg.com/data5/PN/BN/MY-40281611/export-t-shirt-250x250.jpg';
  item4.name = "T-shirt";

  ItemModel item5 = ItemModel();
  item5.img = 'https://oldnavy.gap.com/webcontent/0018/868/480/cn18868480.jpg';
  item5.name = "Sunglasses";

  ItemModel item6 = ItemModel();
  item6.img = 'https://www.indianq.com/wp-content/uploads/2020/01/Superdry-Check-Shirt-For-Men-Maroon.jpg';
  item6.name = "Shirt";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);
  return popularArrayList;
}
