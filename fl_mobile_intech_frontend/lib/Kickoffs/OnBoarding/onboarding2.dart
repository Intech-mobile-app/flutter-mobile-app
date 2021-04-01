import 'package:flutter/material.dart';
import 'package:fl_mobile_intech/MyColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen2 extends StatelessWidget {
  PageController pageController;
  OnBoardingScreen2({this.pageController});
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
              'Get to know your neighbours\n'
              'and connect with them',
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
                  pageController.animateToPage(2,
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
                  margin: EdgeInsets.only(
                      left: 16, right: 16, top: height / 28, bottom: 16),
                  width: width,
                  child: Image.asset(
                    'Assets/Images/onBoarding2.png',
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
