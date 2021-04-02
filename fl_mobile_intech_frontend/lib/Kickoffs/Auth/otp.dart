import 'package:fl_mobile_intech/Kickoffs/Auth/otp_request.dart';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-App-Intech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        accentColor: MyColors.COLOR_PRIMARY_ACCENT,
        primaryColor: MyColors.COLOR_PRIMARY_ACCENT,
      ),
      home: OtpScreen(),
    );
  }
}

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
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffBBBBBB).withOpacity(0.5),
                Color(0xffBBBBBB).withOpacity(0.5),
              ])),
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
                            color: MyColors.OTP_HEADER,
                            fontSize: 18,
                            wordSpacing: 1.0,
                            decoration: TextDecoration.none,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 5.0),
                      Text(
                        "phone number",
                        style: TextStyle(
                            color: MyColors.OTP_HEADER,
                            fontSize: 18,
                            wordSpacing: 1.0,
                            decoration: TextDecoration.none,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 50.0),
                      CircularProgressIndicator(
                        backgroundColor: MyColors.COLOR_APP_PRIMARY,
                      ),
                    ],
                  ),
                ],
              ),
            ));
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 5));
    setState(() {
      len = false;
      _onpressed = () {};
      _controller.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpAuthScreen()));
    });
    overlayEntry.remove();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _printLatestValue() {
    if (_controller.text.toString().length > 9) {
      setState(() {
        len = true;
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
        showOverlay(context);
      };
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 41.4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_rounded,
                          color: MyColors.OTP_HEADER),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 13.2),
                Text(
                  "Register Yourself with Llokality!!!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: MyColors.OTP_HEADER),
                ),
                SizedBox(height: 18.0),
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.OTP_HEADER),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "+91",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      color: MyColors.GRADIENT_WHITE,
                      child: SizedBox(
                        height: 56.0,
                        width: 272.0,
                        child: TextFormField(
                          controller: _controller,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
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
                  height: MediaQuery.of(context).size.height / 9.7,
                ),
                ElevatedButton(
                  onPressed: _onpressed,
                  style: ElevatedButton.styleFrom(
                      primary: _enabled,
                      
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25)))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: MyColors.GRADIENT_WHITE,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
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
              tileMode: TileMode.repeated,
            ),
          ),
        ));
  }
}
