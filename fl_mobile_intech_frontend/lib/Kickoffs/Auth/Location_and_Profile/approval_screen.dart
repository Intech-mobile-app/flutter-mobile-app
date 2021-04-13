import 'package:fl_mobile_intech/export.dart';

class ApprovalScreen extends StatelessWidget {
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
            end: Alignment.bottomCenter,
            colors: [
              MyColors.GRADIENT_BLUE,
              MyColors.GRADIENT_WHITE,
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Please wait while one of your\nsociety members approves you\non the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: MyColors.TEXT_COLOR,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.25,
            ),
          ),
        ),
      ),
    );
  }
}
