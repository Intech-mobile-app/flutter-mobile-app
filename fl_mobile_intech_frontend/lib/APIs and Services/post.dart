import 'package:fl_mobile_intech/export.dart';

class Posts {
  var images;
  createPost() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': API.jsonHeader,
      'x-auth-token': _prefs.getString('authToken'),
    };
    var request =
        Request('POST', Uri.https(API.baseUrl, API.version + API.createPost));
    request.body = '''{\r\n    
        "title":"title",\r\n    
        "post":"test",\r\n    
        "images":images\r\n}
        ''';
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  uploadPosts(var files) async {
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

    StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());
    } else {
      print(response.statusCode);
    }
  }
}
