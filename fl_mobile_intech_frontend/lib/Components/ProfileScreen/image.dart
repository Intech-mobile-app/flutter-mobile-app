import 'package:fl_mobile_intech/APIs%20and%20Services/profilepost.dart';
import 'package:fl_mobile_intech/export.dart';

class ShowImage extends StatefulWidget {
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        ProfilePost(file: pickedFile.path).uploadProfilePost();
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: getImage,
                  icon: Image.asset(
                    'Assets/Images/profile_upload.png',
                    height: 22.0,
                    width: 22.0,
                  )),
              Text('Update the profile picture'),
            ],
          ),
          _image == null
              ? Container(
                  height: 150.0,
                  width: 150.0,
                  child: CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage(
                          'https://uploads-ssl.webflow.com/6030077fdbd53858ff7c4765/603c1ac00b9e8a080528b4ae_SalonBrillareGenericProfileAvi.jpg')))
              : Container(
                  height: 150.0,
                  width: 150.0,
                  child: ClipOval(child: Image.file(_image)),
                )
        ],
      ),
    );
  }
}
