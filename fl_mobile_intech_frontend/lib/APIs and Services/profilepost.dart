import 'package:fl_mobile_intech/export.dart';

class ProfilePost {
  final file;
  Map<String, String> headers = {
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjA3MDVkMDdjMTEwNzEwMDE3OTY1NjQxIiwic2lkIjoiNjA2YWQ2OTMxY2RjNmMwMDE3NjA0MjdlIn0sImlhdCI6MTYxOTE0NTA4MSwiZXhwIjoxNjI2OTIxMDgxfQ.AXVMfkzoB-jmdnv9I7Y9HtSF7zPe6Y9gVjf-1tSrHXs'
        };
  ProfilePost({@required this.file});
  uploadProfilePost() async {
    var request = MultipartRequest(
        'POST', Uri.https(API.baseUrl, API.version + API.profileupload));
    request.headers.addAll(headers);
    request.files.add(MultipartFile(
        'file', File(file).readAsBytes().asStream(), File(file).lengthSync(),
        filename: file.split("/").last));
    var res = await request.send();
    print(res.statusCode);
  }
}
