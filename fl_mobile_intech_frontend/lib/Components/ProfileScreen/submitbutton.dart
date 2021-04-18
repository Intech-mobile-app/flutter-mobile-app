import 'package:fl_mobile_intech/export.dart';

Widget submitbutton() {
  return MaterialButton(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
      ),
    ),
    color: Colors.blue,
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  );
}
