// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as dom;
  
  // List _address;
  // var _lastKnownPosition;

  // _getCurrentLocation() async {
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  //   _lastKnownPosition = await Geolocator.getLastKnownPosition();
  //   print(_lastKnownPosition);
  //   _getAddressFromLatLong(_lastKnownPosition);
  // }

  // _getAddressFromLatLong(_lastKnownPosition) async {
  //   final _coordinates = new Coordinates(
  //       _lastKnownPosition.latitude, _lastKnownPosition.longitude);
  //   _address = await Geocoder.local.findAddressesFromCoordinates(_coordinates);
  //   var first = _address.first;
  //   var _currentCity = first.addressLine.split(',').reversed.toList();
  //   print(first.addressLine);
  //   setState(() {
  //     city = _currentCity[2].toString().replaceAll(RegExp(','), '').toString();
  //     country = 'IN';
  //   });
  //   print(city.toString());
  //   getDataFromWeb(city, country);
  // }
  

    // Future getDataFromWeb(city, country) async {
  //   print('city : $city');
  //   print('country : $country');

  //   final response = await http.get(Uri.http(
  //       'geonames.org', '/postalcode-search.html?q=$city&country=$country/'));
  //   dom.Document document = parser.parse(response.body);
  //   final elements = document.getElementsByTagName('td');
  //   for (int i = 6; i < elements.length; i = i + 9) {
  //     dynamic elem1 = elements[i].innerHtml;
  //     dynamic elem2 = elements[i + 1].innerHtml.toString();

  //     _searchFilterAreaList.add(elem1);
  //     areasOfCity.add(elem1);

  //     _searchFilterPostalList.add(elem2);
  //     postalCodes.add(elem2);
  //   }
  //   _streamController.add(areasOfCity);

  //   print(areasOfCity);
  // }
  

  //--------------------------get_location.dart---------------------------------