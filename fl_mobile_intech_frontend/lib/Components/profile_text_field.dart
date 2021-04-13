import 'package:flutter/material.dart';
import '../export.dart';

Widget generateTextField(labelText, hintText, keyboardType, icon, bottomPadding,
    storeVariable, controller) {
  return Container(
    margin: EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      bottom: bottomPadding == true ? 16.0 : 0.0,
    ),
    color: Colors.white,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: 8.0,
        ),
        focusColor: Colors.white,
        hoverColor: Colors.white,
        isDense: true,
        enabledBorder: InputBorder.none,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: Icon(icon),
        hintStyle: TextStyle(
          fontSize: 16,
          color: MyColors.HINT_TEXT.withOpacity(0.60),
        ),
      ),
      obscureText: false,
    ),
  );
}
