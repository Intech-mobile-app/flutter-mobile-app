import 'dart:async';

import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../MyColors.dart';

class RegisterSociety extends StatefulWidget {
  String city;
  String postalCode;
  String area;

  RegisterSociety({
    this.city,
    this.postalCode,
    this.area,
  });

  @override
  _RegisterSocietyState createState() => _RegisterSocietyState();
}

class _RegisterSocietyState extends State<RegisterSociety> {
  int emptyCount = 0;

  int phNo;
  String name;
  var address;
  var emailId;

  Stream _stream;
  StreamController _streamController;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  Widget generateTextField(labelText, hintText, keyboardType, icon,
      bottomPadding, storeVariable, controller) {
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
          contentPadding: EdgeInsets.all(16.0),
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

  getValidCount() {
    if (_phoneController.text.toString().length != 0 &&
        _nameController.text.toString().length != 0 &&
        _addressController.text.toString().length != 0 &&
        _emailIdController.text.toString().length != 0) {
      setState(() {
        _streamController.add(1);
      });
    } else {
      setState(() {
        _streamController.add(0);
      });
    }
    return _stream;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 45.64,
              ),
              IconButton(
                icon:
                    Icon(Icons.arrow_back_rounded, color: MyColors.TEXT_COLOR),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(
                height: height / 35.27,
              ),
              Text(
                '\t\t${widget.area}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\t\t  ${widget.area},\n\t\t  ${widget.city}, ${widget.postalCode}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height / 38.8,
              ),
              Text.rich(
                TextSpan(text: '\t\t  ', children: [
                  TextSpan(
                      text: 'Not My Society ?',
                      style: TextStyle(
                        color: MyColors.TEXT_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.75,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Tapped');
                          Navigator.pop(context);
                        }),
                ]),
              ),
              SizedBox(
                height: height / 9.7,
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    generateTextField(
                      'Contact No.',
                      'XXXXXXXXXX',
                      TextInputType.number,
                      Icons.drag_indicator_outlined,
                      true,
                      phNo,
                      _phoneController,
                    ),
                    generateTextField(
                      'Your Name',
                      'Lorem Ipsum',
                      TextInputType.name,
                      Icons.text_format_rounded,
                      true,
                      name,
                      _nameController,
                    ),
                    generateTextField(
                      'Apt No/ House No',
                      'No.12 Cheran Nagar, Selvapuram North',
                      TextInputType.name,
                      Icons.my_location_rounded,
                      true,
                      address,
                      _addressController,
                    ),
                    generateTextField(
                      'Email ID',
                      'abc@gmail.com',
                      TextInputType.emailAddress,
                      Icons.alternate_email,
                      false,
                      emailId,
                      _emailIdController,
                    ),
                    SizedBox(
                      height: height / 19.4,
                    ),
                    StreamBuilder(
                        stream: getValidCount(),
                        builder: (context, snapshot) {
                          print('Snapshot Data : ${snapshot.data}');
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: snapshot.data == 1
                                  ? MyColors.BUTTON_ENABLED
                                  : MyColors.BUTTON_DISABLED,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: snapshot.data == 1 ? () {} : null,
                            child: Container(
                              child: Text(
                                'Go!',
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0.75,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
