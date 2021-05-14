import 'package:fl_mobile_intech/export.dart';

class CommentsScreen extends StatefulWidget {
  final postId;
  final authToken;
  CommentsScreen({this.postId, this.authToken});
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  var finalResponse;

  var name;
  var houseNo;
  var title;
  var text;
  bool isDeleted;
  var postImages;
  var comments;

  @override
  void initState() {
    super.initState();
    loadPost();
  }

  loadPost() async {
    var response = await get(
      Uri.parse(API.getPostById + widget.postId),
      headers: {'x-auth-token': widget.authToken},
    );
    finalResponse = jsonDecode(response.body);
    name = finalResponse['data']['user']['profile']['fullName'];
    houseNo = finalResponse['data']['user']['profile']['houseNo'];
    title = finalResponse['data']['title'];
    text = finalResponse['data']['text'];
    isDeleted = finalResponse['data']['isDeleted'];
    postImages = finalResponse['data']['images'];
    comments = finalResponse['data']['comments'];
    print('Response : $isDeleted');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Comments',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: isDeleted != null
          ? SafeArea(
              child: Container(
                width: width,
                height: height / 2,
                padding: EdgeInsets.all(
                  20,
                ),
                child: Column(
                  children: [
                    if (!isDeleted)
                      postViewTemplate(
                        name,
                        houseNo,
                        title,
                        text,
                        postImages,
                        comments,
                        null,
                        null,
                        null,
                        null,
                        null,
                      ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
