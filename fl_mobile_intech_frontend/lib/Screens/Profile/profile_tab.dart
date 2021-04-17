import 'package:fl_mobile_intech/export.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _societycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Please give the following details',
                style: TextStyle(fontSize: 17.0),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: textwidget(context, _namecontroller, 'Name'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: textwidget(context, _emailcontroller, 'Email'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: textwidget(context, _societycontroller, 'Society'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Update the profile picture'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              submitbutton(),
            ],
          ),
        ],
      ),
    );
  }
}
