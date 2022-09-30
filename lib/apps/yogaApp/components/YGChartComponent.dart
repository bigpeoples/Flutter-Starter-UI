import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class YGChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => YGChartWidgetState();
}

class YGChartWidgetState extends State<YGChartWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              margin: 10,
              //  getTextStyles: (value) => TextStyle(color: Colors.white54, fontSize: 12),
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'Mon';
                  case 1:
                    return 'Tue';
                  case 2:
                    return 'Wed';
                  case 3:
                    return 'Thu';
                  case 4:
                    return 'Fri';
                  case 5:
                    return 'Sat';
                  case 6:
                    return 'Sun';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(show: false),
          groupsSpace: 18,
          barGroups: getData(),
        ),
      ).paddingOnly(top: 16),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            rodStackItems: [BarChartRodStackItem(0, 19000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)), toY: 19000000000,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 22000000000,
            rodStackItems: [BarChartRodStackItem(0, 22000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 10000000000,
            rodStackItems: [BarChartRodStackItem(0, 10000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [BarChartRodStackItem(0, 14000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 9000000000,
            rodStackItems: [BarChartRodStackItem(0, 9000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: 12000000000,
            rodStackItems: [BarChartRodStackItem(0, 12000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: 18000000000,
            rodStackItems: [BarChartRodStackItem(0, 18000000000, Colors.white)],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ],
      ),
    ];
  }
}
