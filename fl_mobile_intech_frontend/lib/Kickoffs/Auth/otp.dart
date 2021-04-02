import 'dart:ui';
import 'package:fl_mobile_intech/Kickoffs/Auth/otp_request.dart';
import 'package:fl_mobile_intech/Kickoffs/Auth/request_from_api.dart';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool len = false;
  var _onpressed;
  final _controller = TextEditingController();
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 2.3),
                        Text(
                          "Please wait while we verify your",
                          style: TextStyle(
                              color: MyColors.TEXT_COLOR,
                              fontSize: 18,
                              wordSpacing: 1.0,
                              decoration: TextDecoration.none,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "phone number",
                          style: TextStyle(
                              color: MyColors.TEXT_COLOR,
                              fontSize: 18,
                              wordSpacing: 1.0,
                              decoration: TextDecoration.none,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 50.0),
                        CircularProgressIndicator(

                          backgroundColor: MyColors.CIRCULAR_INDICATOR,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),


                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
    overlayState.insert(overlayEntry);


    await Future.delayed(Duration(seconds: 2));

    await Future.delayed(Duration(milliseconds: 2200));

    setState(() {
      len = false;
      _onpressed = () {};
      _controller.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OtpAuthScreen()));
    });
    overlayEntry.remove();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _printLatestValue() {
    if (_controller.text.toString().length == 10) {
      setState(() {
        len = true;
      });
    } else {
      setState(() {
        len = false;
      });
    }
  }

  void initState() {
    super.initState();
    _controller.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    var _enabled = MyColors.BUTTON_DISABLED;

    if (len) {
      _enabled = MyColors.BUTTON_ENABLED;
      _onpressed = () {
        fetchAuth(_controller.text.toString());
        showOverlay(context);
      };
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 41.4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_rounded,
                          color: MyColors.TEXT_COLOR),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 14.64),
                Text(
                  "Register Yourself with Llokality!!!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: MyColors.TEXT_COLOR),
                ),
                SizedBox(height: 18.0),
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: MyColors.TEXT_COLOR),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.41,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "+91",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      color: MyColors.GRADIENT_WHITE,
                      child: SizedBox(
                        height: 56.0,
                        width: 272.0,
                        child: TextFormField(
                          controller: _controller,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                              
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Contact Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10.77,
                ),
                ElevatedButton(
                  onPressed: _onpressed,
                  style: ElevatedButton.styleFrom(
                      primary: _enabled,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: MyColors.GRADIENT_WHITE,
                          fontSize: 16,
                          
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  MyColors.GRADIENT_BLUE,
                  MyColors.GRADIENT_WHITE
                ],
                tileMode: TileMode.clamp),
            ),

          ),
        );
  }
}
