import 'package:fl_mobile_intech/Kickoffs/Auth/Location_and_Profile/get_location.dart';

import '../../../export.dart';

class RegisterSociety extends StatefulWidget {
  final String city;
  final String postalCode;
  final String area;

  RegisterSociety({
    this.city,
    this.postalCode,
    this.area,
  });

  @override
  _RegisterSocietyState createState() => _RegisterSocietyState();
}

class _RegisterSocietyState extends State<RegisterSociety> {
  int emptyCount = 0;

  int phNo;
  String name;
  var address;
  var emailId;

  Stream _stream;
  StreamController _streamController;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  getValidCount() {
    if (_phoneController.text.toString().length == 10 &&
        _nameController.text.toString().length != 0 &&
        _addressController.text.toString().length != 0 &&
        _emailIdController.text.toString().length != 0) {
      setState(() {
        _streamController.add(1);
      });
    } else {
      setState(() {
        _streamController.add(0);
      });
    }
    return _stream;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.GRADIENT_BLUE, MyColors.GRADIENT_WHITE],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 45.64,
              ),
              IconButton(
                icon:
                    Icon(Icons.arrow_back_rounded, color: MyColors.TEXT_COLOR),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(
                height: height / 35.27,
              ),
              Text(
                '\t\t${widget.area}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\t\t  ${widget.area},\n\t\t  ${widget.city}, ${widget.postalCode}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height / 38.8,
              ),
              Text.rich(
                TextSpan(
                  text: '\t\t  ',
                  children: [
                    TextSpan(
                      text: 'Not My Society ?',
                      style: TextStyle(
                        color: MyColors.TEXT_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.75,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Tapped');
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 9.7,
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    generateTextField(
                      'Contact No.',
                      'Enter your 10 digit mobile number',
                      TextInputType.number,
                      Icons.drag_indicator_outlined,
                      true,
                      phNo,
                      _phoneController,
                    ),
                    generateTextField(
                      'Your Name',
                      'Lorem Ipsum',
                      TextInputType.name,
                      Icons.text_format_rounded,
                      true,
                      name,
                      _nameController,
                    ),
                    generateTextField(
                      'Apt No/ House No',
                      'D1 1101, Dahanukar Regency, Kot...',
                      TextInputType.name,
                      Icons.my_location_rounded,
                      true,
                      address,
                      _addressController,
                    ),
                    generateTextField(
                      'Email ID',
                      'abc@gmail.com',
                      TextInputType.emailAddress,
                      Icons.alternate_email,
                      false,
                      emailId,
                      _emailIdController,
                    ),
                    SizedBox(
                      height: height / 19.4,
                    ),
                    StreamBuilder(
                      stream: getValidCount(),
                      builder: (context, snapshot) {
                        print('Snapshot Data : ${snapshot.data}');
                        return Container(
                          height: height / 18,
                          width: width / 3.75,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: snapshot.data == 1
                                  ? MyColors.BUTTON_ENABLED
                                  : MyColors.BUTTON_DISABLED,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                              ),
                            ),
                            onPressed: snapshot.data == 1
                                ? () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GetLocationScreen(),
                                      ),
                                    );
                                  }
                                : null,
                            child: Container(
                              child: Text(
                                'Go!',
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0.75,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
