import 'package:fl_mobile_intech/export.dart';

class OnBoardingScreen3 extends StatefulWidget {
  final PageController pageController;
  OnBoardingScreen3({this.pageController});

  @override
  _OnBoardingScreen3State createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  dynamic _checkValue = false;
  SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initializePrefs();
  }

  initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE])),
        child: Column(
          children: [
            SizedBox(
              height: height / 3.3,
            ),
            Text(
              'Help each other to maintain\n'
              'your society standards.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: MyColors.TEXT_COLOR,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height / 12.65,
            ),
            SmoothPageIndicator(
              controller: widget.pageController,
              count: 3,
              effect: WormEffect(dotWidth: 10, dotHeight: 10),
              onDotClicked: (index) => widget.pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCubic),
            ),
            Container(
              width: 96,
              height: 36,
              margin: EdgeInsets.only(top: height / 29),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MyColors.BUTTON_ENABLED,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                onPressed: _checkValue == true
                    ? () {
                        _prefs.setInt('newUser', 1);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpScreen()));
                      }
                    : null,
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      left: width / 9, right: width / 9, bottom: height / 6.46),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _checkValue,
                        onChanged: (bool value) => {
                          print(value),
                          setState(() {
                            _checkValue = !_checkValue;
                          })
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "I agree to the ",
                        style: TextStyle(
                            color: MyColors.BLACK_TEXT,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                    color: MyColors.COLOR_APP_PRIMARY,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final url =
                                        'https://github.com/flutter/gallery/';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    }
                                  },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
