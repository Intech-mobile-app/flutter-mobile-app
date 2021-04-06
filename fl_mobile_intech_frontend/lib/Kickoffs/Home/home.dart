import 'dart:async';
import 'dart:ui';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'registerSociety.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> areasOfCity = <dynamic>[];
  List<dynamic> postalCodes = <dynamic>[];
  List<dynamic> _searchFilterAreaList = <dynamic>[];
  List<dynamic> _searchFilterPostalList = <dynamic>[];

  StreamController _streamController;
  Stream _stream;

  String city;
  String country;

  dynamic value;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
    getDataFromWeb();
  }

  setSelectedRadioButton(val) {
    print('value' + val.toString());
    setState(() {
      value = val;
    });
  }

  Widget listAreas() {
    return areasOfCity.length != null
        ? Expanded(
            child: StreamBuilder(
                stream: _stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('Please wait while we load the contents..'),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    itemCount: areasOfCity.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioListTile(
                            activeColor: MyColors.RADIO_BUTTON,
                            toggleable: true,
                            value: index,
                            groupValue: value,
                            onChanged: (val) => setSelectedRadioButton(val),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                new Text(
                                  areasOfCity[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                new Text(
                                  '${city}\t' + postalCodes[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 0.25,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 5,
                            indent: 10,
                            color: Colors.grey,
                          )
                        ],
                      );
                    },
                  );
                }),
          )
        : Container();
  }

  Future getDataFromWeb() async {
    city = 'Pune';
    country = 'IN';
    final response = await http.get(Uri.http('geonames.org',
        '/postalcode-search.html?q=${city}&country=${country}/'));
    dom.Document document = parser.parse(response.body);
    final elements = document.getElementsByTagName('td');
    for (int i = 6; i < elements.length; i = i + 9) {
      dynamic elem1 = elements[i].innerHtml;
      dynamic elem2 = elements[i + 1].innerHtml.toString();

      _searchFilterAreaList.add(elem1);
      areasOfCity.add(elem1);

      _searchFilterPostalList.add(elem2);
      postalCodes.add(elem2);
    }
    _streamController.add(areasOfCity);

    print(areasOfCity);
  }

  searchForSociety(val) {
    setState(() {
      var areaSearch = _searchFilterAreaList.where((element) {
        var availableArea = element.toLowerCase();
        return availableArea.contains(val.toLowerCase());
      }).toList();
      var postalSearch = _searchFilterPostalList.where((element) {
        var availablePostal = element.toString();
        return availablePostal.contains(val);
      }).toList();
      if (areaSearch.length != null) {
        areasOfCity = areaSearch;
      } else if (postalSearch.length != null) {
        postalCodes = postalSearch;
      }
    });
  }

  @override
  void dispose() {
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
                      autofocus: false,
                      onChanged: (val) => searchForSociety(val),
                      decoration: InputDecoration(
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
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
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            listAreas(),
            // streamAreas(),
            SizedBox(
              height: height / 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: value != null
                        ? MyColors.BUTTON_ENABLED
                        : MyColors.BUTTON_DISABLED,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: value != null
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterSociety()));
                      }
                    : null,
                child: Container(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 0.75, color: Colors.white),
                  ),
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
                  width: width / 1.05,
                  height: height / 2.5,
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
