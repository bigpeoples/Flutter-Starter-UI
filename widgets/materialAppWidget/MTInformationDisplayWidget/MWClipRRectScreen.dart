import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class MWClipRRectScreen extends StatefulWidget {
  @override
  MWClipRRectScreenState createState() => MWClipRRectScreenState();
}

class MWClipRRectScreenState extends State<MWClipRRectScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(70.0), topLeft: Radius.circular(170), bottomLeft: Radius.circular(370), bottomRight: Radius.circular(270)),
              child: Image.network('https://i.pinimg.com/originals/bd/79/a4/bd79a4d6860ba48f37062ec58c9c073a.jpg', width: 200, height: 200),
            ),
            16.height,
            ClipOval(
              child: Image.network('https://img.freepik.com/free-photo/muscular-arab-man-training-modern-gym_151355-7426.jpg?size=626&ext=jpg', width: 200, height: 200),
            ),
            16.height,
            ClipPath(
              clipper: TriangleClip(),
              child: Image.network('https://images0.westend61.de/0000793444pw/young-man-reading-book-at-home-GIOF02897.jpg', width: 200, height: 200),
            ),
            16.height,
            ClipRRect(borderRadius: BorderRadius.circular(16), child: Container(color: orange, width: 200, height: 200))
          ],
        ).paddingAll(16),
      ),
    );
  }
}

class TriangleClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClip oldClipper) => false;
}
