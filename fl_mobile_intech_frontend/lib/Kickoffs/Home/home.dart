import 'dart:ui';

import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<dynamic> areasOfCity = <dynamic>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromWeb();
  }

  Widget listAreas() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        itemCount: areasOfCity.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(areasOfCity[index]),
              ),
              Divider(
                color: Colors.grey,
              )
            ],
          );
        },
      ),
    );
  }

  getDataFromWeb() async {
    final response = await http.get(
        'http://www.geonames.org/postalcode-search.html?q=Pune&country=IN');
    dom.Document document = parser.parse(response.body);
    final elements = document.getElementsByTagName('td');
    for (int i = 6; i < elements.length; i = i + 9) {
      dynamic elem = elements[i].innerHtml;
      areasOfCity.add(elem);
    }
    print(areasOfCity);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 14.18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please Search your Society',
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.25,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: MyColors.TEXT_COLOR),
                    ),
                  ),
                  SizedBox(
                    height: height / 48.5,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Search Your society',
                          suffixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: MyColors.HINT_TEXT.withOpacity(0.60))),
                    ),
                  ),
                  SizedBox(
                    height: height / 24.25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'List of available Society',
                      style: TextStyle(
                        color: MyColors.TEXT_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            listAreas(),
            SizedBox(
              height: height / 20,
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {},
                color: MyColors.BUTTON_ENABLED,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 0.75, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height / 38.8,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'Assets/Images/search_society_bck.png',
                  width: width,
                  height: height / 2.33,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
