import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'export.dart';

const _kTestingCrashlytics = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //for force test crash
  //FirebaseCrashlytics.instance.crash();
  runZonedGuarded(() {
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _initializeFlutterFireFuture;
  FirebaseAnalytics analytics = FirebaseAnalytics();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  SharedPreferences _prefs;
  var newUser;
  var phNo;
  var registerSociety;
  var authToken;

  Future<void> _initializeFlutterFire() async {
    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }

    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
  }

  @override
  void initState() {
    super.initState();
    initializePrefs();
    _initializeFlutterFireFuture = _initializeFlutterFire();
  }

  initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      newUser = _prefs.getInt('newUser');
      phNo = _prefs.getInt('phNo');
      registerSociety = _prefs.getInt('registerSociety');
      authToken = _prefs.getString('authToken');
    });
    print('SharedPrefs ${newUser.toString()}');
    print('phNo : $phNo');
    print('registerSociety : $registerSociety');
    print('authToken : $authToken');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Llokality',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        accentColor: MyColors.COLOR_PRIMARY_ACCENT,
        primaryColor: MyColors.COLOR_PRIMARY_ACCENT,
      ),
      home: newUser == null
          ? OnBoardingScreen()
          : phNo == 1
              ? authToken != null
                  ? HomeScreen()
                  : registerSociety == null
                      ? RegisterSociety()
                      : ApprovalScreen()
              : OtpScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => GetLocationScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              height: height / 5.6,
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
