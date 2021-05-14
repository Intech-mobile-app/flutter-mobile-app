import 'package:fl_mobile_intech/export.dart';

class Posts {
  static createPost() async {
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
        "images":["https://storage.googleapis.com/llokality-user-uploads/post_images/WIndows 10 (10).jpg"]\r\n}
        ''';
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  uploadPosts(final file) async {
    var headers = {
      'x-auth-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjA3MDVkMDdjMTEwNzEwMDE3OTY1NjQxIiwic2lkIjoiNjA2YWQ2OTMxY2RjNmMwMDE3NjA0MjdlIn0sImlhdCI6MTYxOTE0NTA4MSwiZXhwIjoxNjI2OTIxMDgxfQ.AXVMfkzoB-jmdnv9I7Y9HtSF7zPe6Y9gVjf-1tSrHXs'
    };
    var request = MultipartRequest(
      'POST',
      Uri.https(API.baseUrl, API.version + API.uploadPost),
    );
    for (int i = 0; i < 5; i++) {
      request.files.add(
        MultipartFile(
          'file',
          File(file).readAsBytes().asStream(),
          File(file).lengthSync(),
        ),
      );
    }
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
