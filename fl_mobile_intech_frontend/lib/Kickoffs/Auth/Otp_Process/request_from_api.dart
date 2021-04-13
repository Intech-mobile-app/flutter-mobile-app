import 'package:fl_mobile_intech/Kickoffs/Auth/Location_and_Profile/get_location.dart';
import 'package:flutter/material.dart';
import 'package:fl_mobile_intech/Components/components_export.dart';

void fetchAuth(String txt) async {
  var baseUrl = 'llokality-intech-xald7lspga-el.a.run.app';
  var auth = '/api/v1.0/auth/phonenumber/' + '91' + txt;
  final response = await get(Uri.https(baseUrl,auth));
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("no" + response.statusCode.toString());
  }
}

postAuth(String code, BuildContext context, String phNo) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var baseUrl = 'llokality-intech-xald7lspga-el.a.run.app';
  var auth = '/api/v1.0/auth/phonenumber/';
  final response = await post(Uri.https(baseUrl, auth),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'phoneNumber': '91' + phNo,
        'code': code.toString()
      }));
  if (response.statusCode == 200) {
    _prefs.setInt('phNo', 1);
    print(response.body);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GetLocationScreen()));
  } else {
    print(response.statusCode);
    print("not Worked");
  }
}
