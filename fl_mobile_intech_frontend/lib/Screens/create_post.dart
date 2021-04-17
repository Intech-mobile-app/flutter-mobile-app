import 'package:fl_mobile_intech/export.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  Color _sendIconColor = MyColors.COLOR_PRIMARY_ACCENT;

  @override
  void initState() {
    super.initState();
  }

  Stream<List> _getSelectedImageList(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield UserFiles.selectedImageFileForPost;
    }
  }

  @override
  void dispose() {
    super.dispose();
    UserFiles.selectedImageFileForPost.clear();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create a Post',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _sendIconColor = MyColors.BUTTON_DISABLED;
                      });
                      Future.delayed(Duration(milliseconds: 1000))
                          .then((value) => setState(() {
                                _sendIconColor = MyColors.COLOR_PRIMARY_ACCENT;
                              }));
                    },
                    tooltip: 'Post your message',
                    icon: const Icon(
                      Icons.send_outlined,
                    ),
                    color: _sendIconColor,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              createPostTextField(
                'Title',
                'Enter the title',
                TextInputType.name,
                Icons.text_format_rounded,
                true,
                null,
                null,
              ),
              createPostTextField(
                'Message',
                'Enter the Message',
                TextInputType.multiline,
                Icons.message,
                true,
                null,
                Icons.attach_file_sharp,
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: _getSelectedImageList(Duration(milliseconds: 1000)),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  print('data length :::');
                  if (!(snapshot.data
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                              .length >
                          0) ||
                      !snapshot.hasData) {
                    return Container();
                  }
                  return Image.file(
                    File(
                      snapshot.data[0]
                          .toString()
                          .replaceAll('File: ', '')
                          .replaceAll("'", ''),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
