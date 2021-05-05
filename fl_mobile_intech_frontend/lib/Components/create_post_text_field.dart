import 'package:fl_mobile_intech/Components/user_files.dart';

import '../export.dart';

Widget createPostTextField( labelText, hintText, keyboardType,
    prefixIcon, bottomPadding, controller,suffixIcon) {
      
      
  return Container(
    margin: EdgeInsets.only(
      bottom: bottomPadding == true ? 16.0 : 0.0,
    ),
    color: Colors.white,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: null,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
        focusColor: Colors.white,
        hoverColor: Colors.white,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: () => _openFiles(),
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: MyColors.HINT_TEXT.withOpacity(0.60),
        ),
      ),
    ),
  );
}

_openFiles() async {
  try {
    if (UserFiles.selectedImageFileForPost != null) {
      UserFiles.selectedImageFileForPost.clear();
    }
    FilePickerResult _result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (_result != null) {
      _result.files.forEach((element) {
        File _file = File(element.path);
        print(_file);
        UserFiles.selectedImageFileForPost.add(_file.path.toString());
      });
    }
  } catch (e) {
    print(e);
  }
}
