import 'package:movpass_interview/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HourlyBarChartWidget extends StatelessWidget {
  final List<int> hourlyData;
  final double maximumValueOnYAxis;
  HourlyBarChartWidget({this.hourlyData, this.maximumValueOnYAxis});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Colors.white,
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: BarChart(
              mainBarData(),
            ),
          ),
        ),
      ),
    );
  }

  // Function to draw the bar.
  BarChartGroupData makeGroupData(
    int x, // x coordinate of the bar
    double y, // value for y axis
  ) {
    return BarChartGroupData(
      x: x,

      /// bar rods is an array and is helpful in case of charts need two bars for same x axis value.
      barRods: [
        BarChartRodData(
          y: y,
          width: 7.0,
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(hourlyData.length, (index) {
      return makeGroupData(index, hourlyData[index].toDouble());
    });
  }

  /// To build x and y axis for graph.
  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true,
      // Build X Axis here.
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 12,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 1:
              return '6:00';
            case 6:
              return '8:00';
            case 11:
              return '12:00';
            case 17:
              return '18:00';
            case 22:
              return '20:00';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(showTitles: false),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      alignment: BarChartAlignment.center,
      groupsSpace: 7.5,
      // To add x-axis and y-axis in the graph we use titlesData.
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      // Function responsible for data bars.
      barGroups: showingGroups(),
    );
  }
}
