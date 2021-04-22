import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/size_config.dart';
import 'package:movpass_interview/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.kBackgroundColor,
          elevation: 0,
          toolbarHeight: 50,
          bottom: TabBar(
            unselectedLabelColor: CustomColors.kLightColor,
            labelColor: CustomColors.kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(color: CustomColors.kBackgroundColor),
            tabs: [
              Tab(
                child: Text(
                  'Semana',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  'Mês',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDashboardCards(),
            _buildDashboardCards2(),
          ],
          //       Container(
          //   height: SizeConfig.blockSizeVertical * 90,
          //   child: Column(
          //     children: [
          //       _buildDaysBar(),
          //       _buildDashboardCards(),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  Expanded _buildDashboardCards() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            HeadingWidget(
              text1: 'Atividade',
              text2: '',
            ),
            _buildActivityCard(
              color1: CustomColors.kLightPinkColor,
              color2: CustomColors.kCyanColor,
              color3: CustomColors.kYellowColor,
              color4: CustomColors.kPurpleColor,
              activityType: 'Treinos',
              metric1: 2,
              metric2: 7,
              iconPath: 'assets/icons/running.svg',
              value: 0.2,
            ),
            HeadingWidget(
              text1: 'Agendado',
              text2: '',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildTaskItem("Douglas - Aeróbico", Colors.red),
                    buildTaskItem("Jeferson - Personal Trainer", Colors.blue),
                    buildTaskItem("Juliana - Personal Trainer", Colors.blue),
                    buildTaskItem("Douglas - Aeróbico", Colors.red),
                    buildTaskItem("Douglas - Aeróbico", Colors.red),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildTaskItem(String courseTitle, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "21/04/2021",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "16:00",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildDashboardCards2() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            HeadingWidget(
              text1: 'Atividade',
              text2: '',
            ),
            _buildActivityCard(
              color1: CustomColors.kLightPinkColor,
              color2: CustomColors.kCyanColor,
              color3: CustomColors.kYellowColor,
              color4: CustomColors.kPurpleColor,
              activityType: 'Treinos',
              metric1: 2,
              metric2: 30,
              iconPath: 'assets/icons/running.svg',
              value: 0.2,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Semana',
            style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            'Mês',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
        ],
      ),
    );
  }

  Container _buildActivityCard(
      {Color color1,
      Color color2,
      Color color3,
      Color color4,
      String activityType,
      int metric1,
      int metric2,
      String iconPath,
      double value}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30,
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: CustomColors.kPrimaryColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: SizeConfig.blockSizeVertical * 12,
              width: SizeConfig.blockSizeHorizontal * 23,
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(130),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                backgroundColor: color2,
                radius: SizeConfig.blockSizeHorizontal * 8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: SizeConfig.blockSizeVertical * 10,
              width: SizeConfig.blockSizeHorizontal * 10,
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5),
                      bottomRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5))),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 6,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 10,
            left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 2,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: SizeConfig.blockSizeVertical * 5, //20
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activityType,
                        style: TextStyle(color: Color(0xffc4bbcc)),
                      ),
                      Text(
                        metric1.toString(),
                        style: CustomTextStyle.metricTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Faltam ',
                    style: TextStyle(color: CustomColors.kLightColor),
                  ),
                  Text(
                    (metric2 - metric1).toString(),
                    style: CustomTextStyle.metricTextStyle,
                  ),
                  Text(
                    ' treinos.',
                    style: TextStyle(color: CustomColors.kLightColor),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.blockSizeVertical * 1,
              width: SizeConfig.blockSizeHorizontal * 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                  value: value,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Color(0xffc4bbcc).withOpacity(0.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
