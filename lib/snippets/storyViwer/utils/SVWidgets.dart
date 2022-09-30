import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

StoryController storyController = StoryController();

class StoryViewWidget extends StatefulWidget {
  final List<String> stories;

  StoryViewWidget({required this.stories});

  @override
  StoryViewWidgetState createState() => StoryViewWidgetState();
}

class StoryViewWidgetState extends State<StoryViewWidget> {
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
    // storyController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.stories.map((e) {
        return StoryItem.pageImage(url: e, controller: storyController, imageFit: BoxFit.cover);
      }).toList(),
      progressPosition: ProgressPosition.top,
      repeat: false,
      controller: storyController,
      onComplete: () {
        finish(context);
      },
    );
  }
}
