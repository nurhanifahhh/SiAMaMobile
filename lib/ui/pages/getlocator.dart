part of 'pages.dart';

class GetLocator extends StatefulWidget {
  @override
  _GetLocatorState createState() => _GetLocatorState();
}

class _GetLocatorState extends State<GetLocator> {
  var locationMessage = '';
  var locationMessage1 = '';

  String latitude;
  String longitude;
  bool isLoading = false;

//   // function for getting the current location
//   // but before that you need to add this permission!
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat";
      locationMessage1 = "Longitude: $long";
    });
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Your Data Absensi',
      subtitle: "Get Your Location Before Scanning QR Code",
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                // controller: txtdosenpengajar,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: locationMessage,
                  // labelText: locationMessage ?? "",
                  prefixIcon: Icon(Icons.add_location),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                // controller: txtdosenpengajar,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: locationMessage1,
                  // labelText: locationMessage ?? "",
                  prefixIcon: Icon(Icons.add_location),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 24, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ButtonTheme(
                buttonColor: mainColor,
                minWidth: double.infinity,
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onPressed: () => getCurrentLocation(),
                        child: Text(
                          "Get Current Location",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //       top: 24, left: defaultMargin, right: defaultMargin),
            //   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            //   child: ButtonTheme(
            //     buttonColor: mainColor,
            //     minWidth: double.infinity,
            //     height: 45,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(22),
            //     ),
            //     child: isLoading
            //         ? CircularProgressIndicator()
            //         : RaisedButton(
            //             padding: EdgeInsets.symmetric(horizontal: 10),
            //             onPressed: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => ScanQRAbsen()),
            //             ),
            //             child: Text(
            //               "Scan QR Code",
            //               style: TextStyle(color: Colors.white, fontSize: 18.0),
            //             ),
            //           ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Future<void> _successDialog() async {
  //   return showDialog<void>(
  //       context: context,
  //       barrierDismissible: false, // user must tap button
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Update Success"),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: <Widget>[
  //                 Text("Your Profile is Updated!"),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text("OK"),
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => ProfilPage()),
  //                 );
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }

  // Future<void> _failedDialog() async {
  //   return showDialog<void>(
  //       context: context,
  //       barrierDismissible: false, // user must tap button
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Update Failed"),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: <Widget>[
  //                 Text("Oops, something went wrong"),
  //                 Text("Please check all the possible mistakes"),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text("OK"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
