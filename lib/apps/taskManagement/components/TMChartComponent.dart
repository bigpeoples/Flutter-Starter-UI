import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TMChartComponent extends StatefulWidget {
  const TMChartComponent({Key? key}) : super(key: key);

  @override
  _TMChartComponentState createState() => _TMChartComponentState();
}

class _TMChartComponentState extends State<TMChartComponent> {
  Color color = Color(0xffff5182);
  Color monthChartRight = Color(0xff46426c);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: context.width(),
      decoration: boxDecorationDefault(color: context.cardColor),
      padding: EdgeInsets.all(20),
      child: LineChart(
        sampleData1(),
        swapAnimationDuration: Duration(milliseconds: 250),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.blueGrey.withOpacity(0.8)),
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        topTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => primaryTextStyle(size: 18),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'Progress';
            }
            return '';
          },
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => boldTextStyle(color: grey),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Sun';
              case 4:
                return 'Mon';
              case 7:
                return 'Tue';
              case 10:
                return 'wed';
              case 13:
                return 'Thur';
              case 16:
                return 'Fri';
              case 18:
                return 'Sat';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          margin: 10,
          showTitles: false,
          getTextStyles: (context, value) => boldTextStyle(color: color),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border(
          bottom: BorderSide(color: monthChartRight, width: 4),
          left: BorderSide(width: 4, color: monthChartRight),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      minX: 0,
      maxX: 18,
      maxY: 8,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 1),
        FlSpot(4, 1),
        FlSpot(7, 3.8),
        FlSpot(10, 4.5),
        FlSpot(13, 2),
        FlSpot(16, 4.8),
        FlSpot(18, 4.6),
      ],
      isCurved: true,
      colors: [tmPrimaryColor],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );

    return [
      lineChartBarData1,
    ];
  }
}

class LineSeries {
  double? dataSpotX;
  double? dataSpotY;

  LineSeries({this.dataSpotX, this.dataSpotY});
}
