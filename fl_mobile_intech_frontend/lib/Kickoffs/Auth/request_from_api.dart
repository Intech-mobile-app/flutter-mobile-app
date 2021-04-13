import 'dart:convert';
import 'package:fl_mobile_intech/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void fetchAuth(String txt) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  var baseUrl = 'llokality-intech-xald7lspga-el.a.run.app';
  var auth = '/api/v1.0/auth/phonenumber/91' + txt;
  _prefs.setString('phoneno', txt);
  print(auth);
  final response = await http.get(Uri.https(baseUrl, auth));
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("no" + response.statusCode.toString());
  }
}

postAuth(String code,BuildContext context) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var baseUrl = 'llokality-intech-xald7lspga-el.a.run.app';
  var auth = '/api/v1.0/auth/phonenumber/';
  final response = await http.post(Uri.https(baseUrl, auth),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'phoneNumber': '91' + _prefs.getString('phoneno').toString(),
        'code': code.toString()
      }));
  if (response.statusCode == 200) {
    print(response.body);
    Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyHomePage()));
  } else {
    print(response.statusCode);
    print("not Worked");
  }
}
