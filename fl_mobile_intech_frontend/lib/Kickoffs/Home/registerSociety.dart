import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';

class RegisterSociety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.GRADIENT_BLUE,
              MyColors.GRADIENT_WHITE
            ]
          )
        ),
      ),
    );
  }
}
