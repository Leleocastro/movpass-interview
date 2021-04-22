import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/size_config.dart';
import 'package:movpass_interview/widgets/activity_pie_chart.dart';
import 'package:movpass_interview/widgets/heading_widget.dart';
import 'package:movpass_interview/widgets/hourly_bar_chart_widget.dart';
import 'package:movpass_interview/widgets/weekly_bar_chart_widget.dart';
import 'package:flutter/material.dart';

class MetricsScreen extends StatelessWidget {
  final List<int> weeklyData = [60, 80, 100, 120, 0, 25, 45];
  final List<int> hourlyData = [
    5,
    7,
    10,
    11,
    17,
    18,
    14,
    15,
    12,
    11,
    8,
    7,
    11,
    19,
    6,
    8,
    10,
    12,
    18,
    16,
    14,
    17,
    11,
    13
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 82,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeadingWidget(
              text1: 'EXERCISE',
              text2: '',
            ),
            ActivityPieChart(),
            HeadingWidget(
              text1: 'ATIVIDADES SEMANAIS (minutos)',
              text2: '',
            ),
            WeeklyBarChartWidget(
              weeklyData: weeklyData,
              maximumValueOnYAxis: 120,
            ),
            // HeadingWidget(
            //   text1: 'MÉDIA DE HORÁRIOS',
            //   text2: '',
            // ),
            // HourlyBarChartWidget(
            //   hourlyData: hourlyData,
            //   maximumValueOnYAxis: 22,
            // ),
          ],
        ),
      ),
    );
  }
}
