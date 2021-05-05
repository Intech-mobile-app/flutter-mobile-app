import 'package:fl_mobile_intech/export.dart';

class Posts {
  var images;
  createPost(BuildContext context,String title, String message) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': API.jsonHeader,
      'x-auth-token': _prefs.getString('authToken'),
    };
    var request =
        Request('POST', Uri.https(API.baseUrl, API.version + API.createPost));
    request.body = jsonEncode(
        <String, dynamic>{"title": title, "post": message, "images": images});
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      print(response.statusCode);
    }
  }

  uploadPosts(BuildContext context,List<dynamic> files, title, message) async {
    print("files passed");

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var headers = {
      'x-auth-token': _prefs.getString('authToken'),
    };
    var request = MultipartRequest(
        'POST', Uri.https(API.baseUrl, API.version + API.uploadPost));
    for (int i = 0; i < files.length; i++) {
      request.files.add(await MultipartFile.fromPath('file', files[i]));
    }

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      var temp = await response.stream.bytesToString();
      images = jsonDecode(temp)['data'];
      createPost(context,title, message);
    } else {
      print(response.statusCode);
    }
  }
}
