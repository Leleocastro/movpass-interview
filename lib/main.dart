import 'package:firebase_core/firebase_core.dart';
import 'package:movpass_interview/screens/activity_form1.dart';
import 'package:movpass_interview/screens/activity_form2.dart';
import 'package:movpass_interview/screens/activity_form3.dart';
import 'package:movpass_interview/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:movpass_interview/utils/appRoutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      routes: {
        AppRoutes.ACTIVITYFORM: (ctx) => ActivityForm(),
        AppRoutes.ACTIVITYFORM2: (ctx) => ActivityForm2(),
        AppRoutes.ACTIVITYFORM3: (ctx) => ActivityForm3(),
      },
    );
  }
}
