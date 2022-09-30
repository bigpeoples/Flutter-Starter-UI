import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/models/SVModel.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/screens/SNStoriesDetailScreen.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/utils/SVDataProvider.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/utils/SVImages.dart';
import 'package:nb_utils/nb_utils.dart';

class StoriesComponent extends StatefulWidget {
  @override
  StoriesComponentState createState() => StoriesComponentState();
}

class StoriesComponentState extends State<StoriesComponent> {
  List<SVStoriesModel> storiesListing = getStories();

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
  // ignore: missing_return
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(SVUser9, height: 50, width: 50, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: white, width: 1.5), borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.add, size: 20, color: white),
                    ),
                  ],
                ),
                4.height,
                Text('Your Story', style: primaryTextStyle(size: 14))
              ],
            ),
          ),
          Container(
            height: 110,
            padding: EdgeInsets.only(left: 8, top: 10),
            child: ListView.builder(
              itemCount: storiesListing.length,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                SVStoriesModel data = storiesListing[i];

                return Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 65,
                        width: 65,
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.transparent, width: 2),
                          gradient: LinearGradient(
                            colors: data.seen!
                                ? [
                                    getColorFromHex('#FFDC80'),
                                    getColorFromHex('#C13584'),
                                    getColorFromHex('#833AB4'),
                                  ]
                                : [
                                    Colors.grey,
                                    Colors.black,
                                    Colors.grey,
                                  ],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(data.img!, height: 50, width: 50, fit: BoxFit.cover),
                        ),
                      ),
                      4.height,
                      Text(data.name!, style: primaryTextStyle(size: 14))
                    ],
                  ),
                ).onTap(() {
                  //  SNStoriesDetailScreen(model: data).launch(context);
                  SNStoriesDetailScreen(storyModel: data).launch(context);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
