import 'package:fl_mobile_intech/export.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      _selectedIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    print('Current Index : $_selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Members',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.COLOR_APP_PRIMARY,
        onTap: _onTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              focusColor: MyColors.COLOR_APP_PRIMARY,
              splashColor: MyColors.BUTTON_ENABLED,
              backgroundColor: Colors.white,
              label: Text(
                'New Post',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              icon: Icon(
                Icons.edit_outlined,
                color: MyColors.COLOR_APP_PRIMARY,
              ),
              onPressed: () {},
            )
          : null,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Llokality',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) => print(index),
        children: [
          HomePage(),
          ProfilePage(),
          MembersPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
