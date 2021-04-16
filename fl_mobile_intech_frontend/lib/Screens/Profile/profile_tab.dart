import 'package:fl_mobile_intech/Components/ProfileScreen/profile_text_widget.dart';
import 'package:fl_mobile_intech/export.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: Text('Please give the following details')),
          SizedBox(
            height: 10.0,
          ),
          textwidget(context),
          textwidget(context),
          textwidget(context),
        ],
      ),
    );
  }
}
