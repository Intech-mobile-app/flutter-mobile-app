import 'package:fl_mobile_intech/export.dart';

Widget textwidget(
    BuildContext context, TextEditingController _controller, String txt) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 40.0,
    child: TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        fillColor: MyColors.PROFILE_TEXT_BG,
        filled: true,
        contentPadding: const EdgeInsets.all(12.0),
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.PROFILE_TEXT_BOX,width: 1.5),
            borderRadius: BorderRadius.circular(8.0)),
        hintText: txt,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  );
}
