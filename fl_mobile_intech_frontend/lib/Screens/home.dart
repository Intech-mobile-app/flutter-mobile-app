import 'package:fl_mobile_intech/Components/bottom_navbar.dart';
import 'package:fl_mobile_intech/Components/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fl_mobile_intech/export.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Llokality',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
    );
  }
}
