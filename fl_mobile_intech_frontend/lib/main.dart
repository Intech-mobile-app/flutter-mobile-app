import 'package:fl_mobile_intech/Kickoffs/Auth/otp.dart';

import 'dart:async';

import 'package:fl_mobile_intech/Kickoffs/OnBoarding/onboarding.dart';

import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Kickoffs/Home/home.dart';
import 'Kickoffs/OnBoarding/onboarding.dart';
import 'Kickoffs/OnBoarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences _prefs;
  var newUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePrefs();
  }

  initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      newUser = _prefs.getInt('newUser');
    });
    print('SharedPrefs ${newUser.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-App-Intech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        accentColor: MyColors.COLOR_PRIMARY_ACCENT,
        primaryColor: MyColors.COLOR_PRIMARY_ACCENT,
      ),
      home: newUser == null ? OnBoardingScreen() : MyHomePage(),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OtpScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
