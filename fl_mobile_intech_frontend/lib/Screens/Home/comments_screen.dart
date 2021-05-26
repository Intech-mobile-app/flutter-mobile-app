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
  var commentsLength;

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
    commentsLength = comments.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget commentField = TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          bottom: 16.0,
          right: 16.0,
        ),
        focusColor: Colors.white,
        hoverColor: Colors.white,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: 'Type in your comments..',
        hintStyle: TextStyle(
          fontSize: 18,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w300,
        ),
        labelText: 'Your comments',
        labelStyle: TextStyle(
          fontSize: 18,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

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
          ? SizedBox.expand(
              child: Stack(
                children: [
                  Column(
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
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.25,
                      minChildSize: 0.12,
                      maxChildSize: 0.8,
                      builder: (context, controller) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
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
                          child: ListView(
                            controller: controller,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 8,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Comments',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.75,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Flexible(
                                      child: commentField,
                                    ),
                                  ),
                                  IconButton(
                                    hoverColor: MyColors.COLOR_PRIMARY_ACCENT,
                                    icon: Icon(
                                      Icons.double_arrow_rounded,
                                      color: MyColors.COLOR_PRIMARY_ACCENT,
                                      size: 35,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              for (var i = 0; i < commentsLength; i++)
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.blue.shade100,
                                            radius: 18,
                                            child: FlutterLogo(
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '$name',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                '$houseNo',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        comments[i]['text'],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: width - 40,
                                        child: Divider(
                                          height: 2,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
