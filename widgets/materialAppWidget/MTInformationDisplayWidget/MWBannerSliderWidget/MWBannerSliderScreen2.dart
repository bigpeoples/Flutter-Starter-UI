import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBannerSliderScreen2 extends StatefulWidget {
  @override
  MWBannerSliderScreen2State createState() => MWBannerSliderScreen2State();
}

class MWBannerSliderScreen2State extends State<MWBannerSliderScreen2> {
  PageController? _pageController;
  int current = 0;
  double viewportFraction = 0.9;
  double pageOffset = 0;

  final List<String> image = [
    'https://i.ytimg.com/vi/0QrbdHhP2Us/maxresdefault.jpg',
    'https://image.freepik.com/free-photo/glad-young-man-resting-cafe-reading-interesting-book-drinking-tea_8353-6242.jpg',
    'https://images0.westend61.de/0000793444pw/young-man-reading-book-at-home-GIOF02897.jpg',
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _pageController = PageController(keepPage: false, initialPage: current, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = _pageController!.page!;
        });
      });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 230,
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  current = index;
                });
              },
              controller: _pageController,
              itemBuilder: (_, index) {
                var imageData = image[index % image.length];
                double scale = (pageOffset - index).abs() + viewportFraction;
                return Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: scale * 10, bottom: scale * 10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(imageData, fit: BoxFit.cover)),
                      Container(decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(8))),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(alignment: Alignment.bottomRight, child: dotIndicator(current % image.length)),
            ),
          ],
        ),
      ).center(),
    );
  }

  Widget itemData(String text) {
    return Container(
      padding: EdgeInsets.only(top: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.white),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  /* dot indicator */
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
                  padding: EdgeInsets.all(3),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(color: e == index ? Colors.white : Colors.white.withOpacity(0.4), borderRadius: BorderRadius.circular(30)),
                    width: e == index ? 20 : 8,
                    height: 8,
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
