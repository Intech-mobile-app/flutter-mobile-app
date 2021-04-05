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
