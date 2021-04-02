import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';

class OtpAuthScreen extends StatefulWidget {
  @override
  _OtpAuthScreenState createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE])),
      ),
    );
  }
}
