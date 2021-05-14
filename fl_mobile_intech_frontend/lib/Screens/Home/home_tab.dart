import 'package:fl_mobile_intech/Screens/Home/comments_screen.dart';
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
    print('imageUrl : ${finalResponse['data'][0]['images']}');
    print('datalength : ${finalResponse['data'].length}');
    dataLength = finalResponse['data'].length;
    setState(() {});
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
          GestureDetector(
            onTap: () => {
              print('Tapped $i'),
            },
            child: StreamBuilder(
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

                if (!isDeleted)
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: postViewTemplate(
                      fullName,
                      houseNo,
                      title,
                      message,
                      postImages,
                      comments,
                      null,
                      true,
                      context,
                      postId,
                      authToken,
                    ),
                  );
                return Container();
              },
            ),
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
