import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/models/SVModel.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/utils/SVWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class SNStoriesDetailScreen extends StatefulWidget {
  final SVStoriesModel? storyModel;

  SNStoriesDetailScreen({this.storyModel});

  @override
  SNNewStoryDetailScreenState createState() => SNNewStoryDetailScreenState();
}

class SNNewStoryDetailScreenState extends State<SNStoriesDetailScreen> {
  List<String> stories = [
    "https://wallpapercave.com/wp/wp4967975.jpg",
    "https://i.pinimg.com/originals/c8/ca/7f/c8ca7f0559e5c62e8ba6ad12b80e67e1.jpg",
    "https://i.pinimg.com/originals/f5/8e/26/f58e265c127b8851c95f0cf81d5b2141.jpg",
    "https://i.pinimg.com/originals/17/a2/7c/17a27c7f29b5df5c3fab815e9209e31e.jpg"
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            StoryViewWidget(stories: stories),
            Positioned(
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.close, color: white, size: 20),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(top: 8, left: 8),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(widget.storyModel!.img!, fit: BoxFit.cover),
                            ),
                          ),
                          8.width,
                          Text(widget.storyModel!.name.validate(), style: primaryTextStyle(color: white, size: 16)),
                          8.width,
                          Text(widget.storyModel!.time.validate(), style: secondaryTextStyle(size: 16, color: white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
