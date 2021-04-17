import 'package:fl_mobile_intech/export.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width / 1.5,
      padding: EdgeInsets.only(
        top: 38,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Llokality',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Divider(
            color: Colors.black54,
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Text(
                    'version - 1.0.0',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
