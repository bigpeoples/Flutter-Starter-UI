import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBannerSliderScreen1 extends StatefulWidget {
  @override
  MWBannerSliderScreen1State createState() => MWBannerSliderScreen1State();
}

class MWBannerSliderScreen1State extends State<MWBannerSliderScreen1> {
  PageController? pageController;
  int current = 0;
  Timer? timer;

  final List<String> image = [
    'https://static.toiimg.com/thumb/msid-78118340,imgsize-896783,width-800,height-600,resizemode-75/78118340.jpg',
    'https://www.axisbank.com/images/default-source/progress-with-us_new/home-gym.jpg',
    'https://runningmagazine.ca/wp-content/uploads/2020/07/Screen-Shot-2020-07-19-at-4.10.38-PM-1200x675.jpg',
    'https://freedesignfile.com/upload/2016/10/Strong-male-gym-workout-biceps-HD-picture.jpg',
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: current);
    timer = Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (current < image.length) {
          current++;
        } else {
          current = 0;
        }
        if (pageController!.hasClients) {
          pageController!.animateToPage(current, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        }
        if (!pageController!.hasClients) {
          timer.cancel();
        }
        print(current);
        setState(() {});
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 250,
              child: PageView.builder(
                itemCount: image.length,
                scrollDirection: Axis.vertical,
                reverse: true,
                onPageChanged: (index) {
                  setState(() {
                    current = index;
                  });
                },
                controller: pageController,
                itemBuilder: (_, index) {
                  var imageData = image[index % image.length];

                  return commonCacheImageWidget(imageData, 300, fit: BoxFit.cover);
                },
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: RotatedBox(
                quarterTurns: 3,
                child: Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Align(alignment: Alignment.center, child: dotIndicator(current % image.length)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dotIndicator(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: image
          .asMap()
          .map(
            (e, value) {
              return MapEntry(
                e,
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(color: e == index ? Colors.black : Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(30)),
                    width: e == index ? 20 : 8,
                    height: e == index ? 10 : 8,
                  ),
                ),
              );
            },
          )
          .values
          .toList(),
    );
  }
}
