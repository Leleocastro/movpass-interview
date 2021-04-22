import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/screens/activity_form1.dart';
import 'package:movpass_interview/screens/activity_screen.dart';
import 'package:movpass_interview/screens/dashboard_screen.dart';
import 'package:movpass_interview/screens/metrics_screen.dart';
import 'package:movpass_interview/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    DashboardScreen(),
    ActivityScreen(),
    MetricsScreen(),
    Center(
      child: Text('Perfil'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 25,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: CustomColors.kPrimaryColor,
            ),
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: Colors.grey,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: CustomColors.kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityForm()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
