import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSliderScreen extends StatefulWidget {
  static String tag = '/MWSliderScreen';

  @override
  MWSliderScreenState createState() => MWSliderScreenState();
}

class MWSliderScreenState extends State<MWSliderScreen> {
  double _value2 = 0.33;
  RangeValues _currentRangeValues = const RangeValues(20, 100);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
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
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text('Custom Color Slider', style: boldTextStyle()),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.green[200],
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 4.0,
                thumbColor: Colors.green,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Colors.green.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: Slider(
                label: 'Hello',
                value: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text('Range Slider', style: boldTextStyle()),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.indigo[700],
                inactiveTrackColor: Colors.indigo[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.indigo,
                overlayColor: Colors.indigo.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.indigo[700],
                inactiveTickMarkColor: Colors.indigo[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.indigo,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
