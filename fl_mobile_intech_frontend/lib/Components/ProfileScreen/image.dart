import 'package:fl_mobile_intech/export.dart';

Widget image() {
  return Container(
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: Image(
          image: NetworkImage(
              'https://uploads-ssl.webflow.com/6030077fdbd53858ff7c4765/603c1ac00b9e8a080528b4ae_SalonBrillareGenericProfileAvi.jpg')));
}
