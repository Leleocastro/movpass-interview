import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/model/days.dart';
import 'package:movpass_interview/size_config.dart';
import 'package:movpass_interview/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int current = 4;
    return Container(
      height: SizeConfig.blockSizeVertical * 90,
      width: double.infinity,
      child: Column(
        children: [_buildDateSection(current), _buildActivitySection()],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColors.kBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              HeadingWidget(
                text1: 'ATIVIDADES',
                text2: 'Mostrar Tudo',
              ),
              _buildCard(
                  color: CustomColors.kYellowColor,
                  title: 'Yoga',
                  subtitle: 'Prof. Roberta',
                  time: '6:45',
                  iconPath: 'assets/icons/running.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Exercício',
                  subtitle: 'Personal Carlos',
                  time: '10:00',
                  iconPath: 'assets/icons/bike.svg'),
              HeadingWidget(
                text1: 'ALIMENTAÇÃO',
                text2: 'Mostrar Tudo',
              ),
              _buildCard(
                  color: CustomColors.kLightPinkColor,
                  title: 'Café da Manhã',
                  subtitle: 'Chá, Pão com Ovo',
                  time: '6:00',
                  iconPath: 'assets/icons/coffee.svg'),
              _buildCard(
                  color: CustomColors.kPrimaryColor,
                  title: 'Lanche',
                  subtitle: 'Sanduíche',
                  time: '14:00',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Jantar',
                  subtitle: 'Arroz com frango',
                  time: '20:00',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Jantar',
                  subtitle: 'Arroz com frango',
                  time: '21:00',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Jantar',
                  subtitle: 'Arroz com frango',
                  time: '22:00',
                  iconPath: 'assets/icons/food.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(
      {Color color,
      String title,
      String subtitle,
      String time,
      String iconPath}) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.2),
              child: SvgPicture.asset(
                iconPath,
                height: SizeConfig.blockSizeVertical * 4,
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Text(
                subtitle,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ],
          ),
          Expanded(child: Container()),
          Text(
            time,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          )
        ],
      ),
    );
  }

  Container _buildDateSection(int current) {
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int dayValue = int.parse(days[index].dayNumber);
            return Container(
              padding: const EdgeInsets.all(6.0),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Text(
                    days[index].dayName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: dayValue == current
                          ? CustomColors.kPrimaryColor
                          : dayValue > current
                              ? CustomColors.kLightColor
                              : Colors.black,
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  CircleAvatar(
                    backgroundColor: dayValue == current
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent,
                    child: Text(
                      days[index].dayNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dayValue >= current
                            ? CustomColors.kLightColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
