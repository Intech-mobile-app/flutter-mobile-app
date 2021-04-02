import 'package:fl_mobile_intech/Kickoffs/Auth/otp.dart';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';


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
        accentColor: MyColors.COLOR_PRIMARY_ACCENT,
        primaryColor: MyColors.COLOR_PRIMARY_ACCENT,
      ),
      home: MyHomePage(title: 'Main Page'),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        
      ),
      body: OtpScreen(),
    );
  }
}
