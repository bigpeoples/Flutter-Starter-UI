import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWTransformScreen extends StatefulWidget {
  @override
  MWTransformScreenState createState() => MWTransformScreenState();
}

class MWTransformScreenState extends State<MWTransformScreen> {
  double x = 0;
  double y = 0;
  double z = 0;

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
    return SafeArea(
      child: Scaffold(
        body: Transform(
          transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = y - details.delta.dx / 100;
                x = x + details.delta.dy / 100;
              });
            },
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow()),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_outlined, color: black),
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      Text('TransFrom Image', style: boldTextStyle())
                    ],
                  ),
                ),
                commonCacheImageWidget(
                  'https://images.unsplash.com/photo-1572111504021-40abd3479ddb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                  context.height(),
                  width: context.width(),
                  fit: BoxFit.cover,
                ).expand(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
