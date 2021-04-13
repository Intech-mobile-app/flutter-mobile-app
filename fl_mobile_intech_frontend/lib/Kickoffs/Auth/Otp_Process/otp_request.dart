import 'package:fl_mobile_intech/export.dart';

class OtpAuthScreen extends StatefulWidget {
  final String phNo;
  OtpAuthScreen({this.phNo});
  @override
  _OtpAuthScreenState createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print(widget.phNo);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(height: height / 45.4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_rounded,
                      color: MyColors.TEXT_COLOR),
                  onPressed: () {
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => OtpScreen()));
                  },
                ),
              ],
            ),
            SizedBox(height: height / 4.6),
            Text(
              "Verification Code",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: MyColors.TEXT_COLOR),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Enter the verification code sent to",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MyColors.BLACK_TEXT),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "+91-" + widget.phNo.toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: MyColors.BLACK_TEXT),
            ),
            SizedBox(
              height: 40.0,
            ),
            OtpBox(
              phNo: widget.phNo,
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE])),
      ),
    );
  }
}

class OtpBox extends StatefulWidget {
  final phNo;
  OtpBox({this.phNo});
  @override
  _OtpBoxState createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white54,
    border: Border.all(color: MyColors.OTP_BOX_INSIDE),
  );
  _otpshare() {
    if (_pinPutController.text.toString().length == 6) {
      OtpRequest().postAuth(
          _pinPutController.text.toString(), context, widget.phNo.toString());
    } else {}
  }

  void initState() {
    super.initState();
    _pinPutController.addListener(_otpshare);
  }

  @override
  void dispose() {
    super.dispose();
    _pinPutController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinPut(
      eachFieldWidth: 48.0,
      fieldsAlignment: MainAxisAlignment.spaceEvenly,
      keyboardType: TextInputType.number,
      fieldsCount: 6,
      eachFieldHeight: 50.0,
      withCursor: true,
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: pinPutDecoration.copyWith(
          border: Border.all(color: MyColors.OTP_BOX_OUTLINE)),
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration.copyWith(
        border: Border.all(color: MyColors.OTP_BOX_INSIDE),
      ),
    );
  }
}
