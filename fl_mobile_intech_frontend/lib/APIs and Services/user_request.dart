import 'package:fl_mobile_intech/export.dart';

class UserRequest {
  static createUser(Map user) async {
    dynamic response = await post(
      Uri.https(API.baseUrl, API.users),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(user),
    );
    print(response.statusCode);
    return response.statusCode;
  }

  static getSocietyId(String societyName) async {
    var societyUrl = API.society + societyName;
    dynamic response = await get(
      Uri.https(
        API.baseUrl,
        societyUrl,
      ),
    );
    dynamic cityId = jsonDecode(response.body)['data'][0]['_id'];
    print(cityId);
    return cityId;
  }
}
