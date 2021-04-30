import 'package:fl_mobile_intech/export.dart';

class Posts {
  SharedPreferences _prefs;
  final Map<dynamic, dynamic> _body = {'title': '', 'post': '', 'images': ''};
  createPost() async {
    var response = await post(
        Uri.https(API.baseUrl, API.version + API.createPost),
        headers: {'x-auth-token': _prefs.getString('authToken')},
        body: _body);
    print(response.body);
  }
}

