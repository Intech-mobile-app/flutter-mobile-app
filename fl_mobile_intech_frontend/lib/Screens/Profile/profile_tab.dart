import 'package:fl_mobile_intech/export.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _societycontroller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
                style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
              )),
          Padding(
            padding:
                const EdgeInsets.only(top: 15.0,bottom: 5.0,left: 15.0,right: 15.0),
            child: textwidget(context, _namecontroller, 'Name'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: textwidget(context, _emailcontroller, 'Email'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: textwidget(context, _societycontroller, 'Society'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('Assets/Images/profile_upload.png',height: 22.0,width: 22.0,)),
                Text('Update the profile picture'),
              ],
            ),
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
