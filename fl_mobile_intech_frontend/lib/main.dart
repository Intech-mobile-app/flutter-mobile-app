import 'package:fl_mobile_intech/Kickoffs/OnBoarding/onboarding.dart';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-App-Intech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
        accentColor: MyColors.COLOR_PRIMARY_ACCENT,
        primaryColor: MyColors.COLOR_PRIMARY_ACCENT,
      ),
      home: OnBoardingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: MyColors.COLOR_PRIMARY_BLUE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height / 5.6,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'My Society',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width,
                  child: Image.asset(
                    'Assets/Images/splash_bck.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
