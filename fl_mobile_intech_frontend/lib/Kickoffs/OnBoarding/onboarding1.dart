import 'package:flutter/material.dart';
import 'package:fl_mobile_intech/Components/components_export.dart';

class OnBoardingScreen1 extends StatelessWidget {
  final PageController pageController;

  OnBoardingScreen1({this.pageController});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: MyColors.COLOR_PRIMARY_BLUE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height / 6.86,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'My Society',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height / 38.8,
                left: 16,
                right: 16,
              ),
              child: Text(
                'A social platform where you\n will be always updated about\n your society',
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 0.25,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: height / 16.86,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(dotWidth: 10, dotHeight: 10),
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCubic),
            ),
            Container(
              width: 96,
              height: 36,
              margin: EdgeInsets.only(top: height / 29),
              child: MaterialButton(
                focusColor: MyColors.COLOR_APP_PRIMARY,
                highlightColor: MyColors.COLOR_APP_PRIMARY,
                splashColor: MyColors.COLOR_APP_PRIMARY,
                color: MyColors.BUTTON_ENABLED,
                onPressed: () => {
                  pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn)
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
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
                  width: width,
                  child: Image.asset(
                    'Assets/Images/splash_bck.jpg',
                    fit: BoxFit.cover,
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
