import 'package:fl_mobile_intech/export.dart';

Future<PickedFile> fileimage;
pickFromGallery(ImageSource source) {
  fileimage = ImagePicker().getImage(source: source);
}

Widget showImage() {
  return FutureBuilder<PickedFile>(
      future: fileimage,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 150.0,
            height: 150.0,
          );
        } else {
          return Container(
              height: 150.0,
              width: 150.0,
              child: CircleAvatar(
                  radius: 10.0,
                  backgroundImage: NetworkImage(
                      'https://uploads-ssl.webflow.com/6030077fdbd53858ff7c4765/603c1ac00b9e8a080528b4ae_SalonBrillareGenericProfileAvi.jpg')));
        }
      });
}
