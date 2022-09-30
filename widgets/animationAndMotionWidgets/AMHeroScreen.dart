import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class AMHeroScreen extends StatefulWidget {
  static String tag = '/AMHeroScreen';

  @override
  AMHeroScreenState createState() => AMHeroScreenState();
}

class AMHeroScreenState extends State<AMHeroScreen> {
  late List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = context.width() / 2;
    double cardHeight = context.height() / 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mListing.length,
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: cardWidth / cardHeight),
          itemBuilder: (context, index) => Product(mListing[index], index),
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
    return GestureDetector(
      onTap: () {
        DetailScreen(name: model.name, image: model.img).launch(context);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: model.img,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(12.0),
                child: commonCacheImageWidget(
                  model.img,
                  context.height() / 6,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(model.name, style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : textPrimaryColor)),
                ],
              ),
            )
          ],
        ),
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
  item4.img = 'https://cdn4.vectorstock.com/i/1000x1000/74/58/unisex-3d-t-shirt-on-clothes-hanger-blank-tshirt-vector-26857458.jpg';
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

  return popularArrayList;
}

class DetailScreen extends StatefulWidget {
  DetailScreen({this.name, this.image});

  final String? name;
  final String? image;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var text = lipsum.createText(numParagraphs: 3, numSentences: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.image!,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                child: commonCacheImageWidget(
                  widget.image,
                  400,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            16.height,
            Text(widget.name!, style: boldTextStyle()).paddingOnly(left: 16),
            16.height,
            Text(
              text,
              style: primaryTextStyle(),
            ).paddingAll(8)
          ],
        ),
      ),
    );
  }
}
