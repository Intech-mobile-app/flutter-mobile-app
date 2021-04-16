import 'package:fl_mobile_intech/export.dart';

Widget textwidget(BuildContext context) {
  return SafeArea(
    child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 25.0,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        )),
  );
}
