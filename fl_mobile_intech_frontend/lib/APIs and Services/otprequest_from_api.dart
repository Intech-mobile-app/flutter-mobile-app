import 'package:fl_mobile_intech/export.dart';

class OtpRequest {
  void fetchAuth(String txt) async {
    final response = await get(Uri.https(API.baseUrl, API.auth + '91' + txt));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("no" + response.statusCode.toString());
    }
  }

  postAuth(String code, BuildContext context, String phNo) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await post(Uri.https(API.baseUrl, API.auth ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'phoneNumber': '91' + phNo,
          'code': code.toString()
        }));
    if (response.statusCode == 200) {
      _prefs.setInt('phNo', 1);
      var user = Otpuser.fromJson(jsonDecode(response.body));
      if (user.data == 'newUser'){
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => GetLocationScreen()));
      }
      else if (user.data == 'existingUnverifiedUser'){
        //need to be changed in future to a different screen
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => GetLocationScreen()));
      }
      else{
        //need to be changed in future to a different screen
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => GetLocationScreen()));
      }
    } else {
      print(response.statusCode);
      print("not Worked");
    }
  }
}

class Otpuser {
  final String data;

  Otpuser({this.data});

  factory Otpuser.fromJson(Map<dynamic, dynamic> json) {
    return Otpuser(
      data: json['data']['message'],
    );
  }
}
