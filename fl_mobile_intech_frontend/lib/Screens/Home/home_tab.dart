import 'package:fl_mobile_intech/export.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;
  SharedPreferences _prefs;
  var authToken;
  var imageUrl;
  var postId;
  var title;
  var message;
  var finalResponse;
  dynamic dataLength = 0;

  Stream loadUrl() async* {
    var postResponse = await get(
      Uri.parse(
        API.getAllPosts,
      ),
      headers: {'x-auth-token': authToken},
    );
    var response = jsonDecode(postResponse.body);
    yield response;
  }

  getContents() async {
    var postResponse = await get(
      Uri.parse(
        API.getAllPosts,
      ),
      headers: {'x-auth-token': authToken},
    );
    finalResponse = jsonDecode(postResponse.body);
    
    setState(() {
      dataLength = finalResponse['data'].length;
    });
  }

  getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    authToken = _prefs.getString('authToken');
    getContents();
  }

  @override
  void initState() {
    super.initState();
    getInstance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var dynamicContentsWidget = Column(
      children: [
        for (int i = 0; i < dataLength; i++)
          StreamBuilder(
            stream: loadUrl(),
            builder: (context, snapshot) {
              var fullName =
                  finalResponse['data'][i]['user']['profile']['fullName'];
              var houseNo =
                  finalResponse['data'][i]['user']['profile']['houseNo'];
              var title = finalResponse['data'][i]['title'];
              var message = finalResponse['data'][i]['text'];
              var postImages = finalResponse['data'][i]['images'];
              var postId = finalResponse['data'][i]['_id'];
              var comments = finalResponse['data'][i]['comments'];
              bool isDeleted = finalResponse['data'][i]['isDeleted'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        radius: 25,
                        child: FlutterLogo(
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$fullName',
                            style: TextStyle(
                              fontSize: 16,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$message',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  postImages != null
                      ? SizedBox(
                          height: 120,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: postImages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      15,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      postImages[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '${comments.length} Comments',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.question_answer_outlined,
                        size: 22,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black54,
                  ),
                ],
              );
            },
          ),
      ],
    );

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: dynamicContentsWidget,
          ),
        ),
      ),
    );
  }
}
