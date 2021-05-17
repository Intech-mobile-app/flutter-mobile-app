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
      body: isDeleted == false
          ? SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: height / 2,
                          padding: EdgeInsets.all(
                            20,
                          ),
                          child: Column(
                            children: [
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
                      ],
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.2,
                    minChildSize: 0.2,
                    maxChildSize: 0.6,
                    builder: (context, controller) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.TEXT_COLOR.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Drag to display comments',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: MyColors.TEXT_COLOR.withOpacity(0.7),
                                  letterSpacing: 0.75,
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                controller: controller,
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Item $index'),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
