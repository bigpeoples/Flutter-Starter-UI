import 'package:flutter/material.dart';

class MWDigitalSignatureListScreen2 extends StatefulWidget {
  @override
  MWDigitalSignatureListScreen3State createState() => MWDigitalSignatureListScreen3State();
}

class MWDigitalSignatureListScreen3State extends State<MWDigitalSignatureListScreen2> {
  static final List colors = [
    Colors.black,
    Colors.purple,
    Colors.green,
  ];
  static final List lineWidths = [3.0, 5.0, 8.0];

  // File imageFile;
  int selectedLine = 0;
  Color selectedColor = colors[0];
  List points = [Point(colors[0], lineWidths[0], [])];
  int curFrame = 0;
  bool isClear = false;

  double get strokeWidth => lineWidths[selectedLine];

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
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: _buildCanvas(),
                      top: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                    ),
                  ],
                ),
              ),
            ),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildCanvas() {
    return StatefulBuilder(builder: (context, state) {
      return CustomPaint(
        painter: CustomePainter(
          points: points,
          strokeColor: selectedColor,
          strokeWidth: strokeWidth,
          isClear: isClear,
        ),
        child: GestureDetector(
          onPanStart: (details) {
            // before painting, set color & strokeWidth.
            isClear = false;
            points[curFrame].color = selectedColor;
            points[curFrame].strokeWidth = strokeWidth;
          },
          onPanUpdate: (details) {
            RenderBox referenceBox = context.findRenderObject() as RenderBox;
            Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
            state(() {
              points[curFrame].points.add(localPosition);
            });
          },
          onPanEnd: (details) {
            // preparing for next line painting.
            points.add(Point(selectedColor, strokeWidth, []));
            curFrame++;
          },
        ),
      );
    });
  }

  Widget _buildBottom() {
    return Container(
      color: Colors.pink,
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: StatefulBuilder(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Icon(
                Icons.brightness_1,
                size: 10.0,
                color: selectedLine == 0 ? Colors.white : Colors.white.withOpacity(0.5),
              ),
              onTap: () {
                state(() {
                  selectedLine = 0;
                });
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.brightness_1,
                size: 15.0,
                color: selectedLine == 1 ? Colors.white : Colors.white.withOpacity(0.5),
              ),
              onTap: () {
                state(() {
                  selectedLine = 1;
                });
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.brightness_1,
                size: 20.0,
                color: selectedLine == 2 ? Colors.white : Colors.white.withOpacity(0.5),
              ),
              onTap: () {
                state(() {
                  selectedLine = 2;
                });
              },
            ),
            GestureDetector(
              child: Container(
                color: selectedColor == colors[0] ? Colors.white : Colors.white.withOpacity(0.2),
                child: Icon(
                  Icons.create,
                  color: colors[0],
                ),
              ),
              onTap: () {
                state(() {
                  selectedColor = colors[0];
                });
              },
            ),
            GestureDetector(
              child: Container(
                color: selectedColor == colors[1] ? Colors.white : Colors.white.withOpacity(0.2),
                child: Icon(
                  Icons.create,
                  color: colors[1],
                ),
              ),
              onTap: () {
                state(() {
                  selectedColor = colors[1];
                });
              },
            ),
            GestureDetector(
              child: Container(
                color: selectedColor == colors[2] ? Colors.white : Colors.white.withOpacity(0.2),
                child: Icon(
                  Icons.create,
                  color: colors[2],
                ),
              ),
              onTap: () {
                state(() {
                  selectedColor = colors[2];
                });
              },
            ),
            GestureDetector(
              child: Text(
                'clear',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  reset();
                });
              },
            ),
          ],
        );
      }),
    );
  }

  void reset() {
    isClear = true;
    curFrame = 0;
    points.clear();
    points.add(Point(selectedColor, strokeWidth, []));
  }
}

class Point {
  Color color;
  List points;
  double strokeWidth = 5.0;

  Point(this.color, this.strokeWidth, this.points);
}

class CustomePainter extends CustomPainter {
  final double strokeWidth;
  final Color strokeColor;
  Paint? _linePaint;
  final bool isClear;
  final List points;

  CustomePainter({
    required this.points,
    required this.strokeColor,
    required this.strokeWidth,
    this.isClear = true,
  }) {
    _linePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  void paint(Canvas canvas, Size size) {
    if (isClear || points.length == 0) {
      return;
    }
    for (int i = 0; i < points.length; i++) {
      _linePaint!..color = points[i].color;
      _linePaint!..strokeWidth = points[i].strokeWidth;
      List curPoints = points[i].points;
      if (curPoints.length == 0) {
        break;
      }
      for (int i = 0; i < curPoints.length - 1; i++) {
        if (curPoints[i] != null && curPoints[i + 1] != null) canvas.drawLine(curPoints[i], curPoints[i + 1], _linePaint!);
//      canvas.drawPoints(PointMode.polygon, curPoints, _linePaint);
      }
    }
  }

  bool shouldRepaint(CustomePainter other) => true;
}
