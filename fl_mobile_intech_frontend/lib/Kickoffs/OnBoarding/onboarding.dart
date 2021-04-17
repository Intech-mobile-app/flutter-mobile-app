import 'package:fl_mobile_intech/export.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  dynamic pageIndex;
  PageController _pageController;
  int currentIndex = 0;

  var onBoardingScreens = {
    '1': OnBoardingScreen1(),
    '2': OnBoardingScreen2(),
    '3': OnBoardingScreen3(),
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) => {print(index), pageIndex = index},
        children: [
          OnBoardingScreen1(
            pageController: _pageController,
          ),
          OnBoardingScreen2(
            pageController: _pageController,
          ),
          OnBoardingScreen3(
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
