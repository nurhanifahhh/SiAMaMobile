part of 'pages.dart';

class GetLocator extends StatefulWidget {
  @override
  _GetLocatorState createState() => _GetLocatorState();
}

class _GetLocatorState extends State<GetLocator> {
  CourseModel courseModel = new CourseModel();
  String courseId = "0";
  bool isLoading = false;
  var locationMessage = '';
  var locationMessage1 = '';
  String latitude;
  String longitude;

  // function for getting the current location
  // but before that you need to add this permission!
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

  // void qrCode() async {
  //   String qrCode =
  //       "https://tinyurl.com/4btxca26";

  //   if (await canLaunch(qrCode)) {
  //     await launch(qrCode);
  //   } else
  //     throw ("Couldn't open QR Code");
  // }

  @override
  void initState() {
    readCourseData();
    super.initState();
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
            Container(margin: EdgeInsets.all(8)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                // controller: txtnamamatkul,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.nama_matakuliah,
                  // labelText: courseModel.nama_matakuliah ?? "",
                  prefixIcon: Icon(Icons.book_online),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                // controller: txthari,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.hari,
                  // labelText: courseModel.hari ?? "",
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                // controller: txttanggal,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.tanggal,
                  // labelText: courseModel.tanggal ?? "",
                  prefixIcon: Icon(Icons.date_range_outlined),
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
                // controller: txtwaktu,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.waktu,
                  // labelText: courseModel.waktu ?? "",
                  prefixIcon: Icon(Icons.timer_rounded),
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
                  hintText: courseModel.dosen_pengajar,
                  // labelText: courseModel.dosen_pengajar ?? "",
                  prefixIcon: Icon(Icons.person),
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScanQRAbsen()),
                        ),
                        child: Text(
                          "Scan QR Code",
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
            //             onPressed: () => nextScan(),
            //             child: Text(
            //               "Next",
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

  void readCourseData() async {
    final storage = FlutterSecureStorage();
    courseId = await storage.read(key: Constanta.keyCourseId);
    getDataCourse();
  }

  void getDataCourse() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": courseId,
    };
    var requestBody = jsonEncode(map);
    CourseServices.getCourse(requestBody).then((value) {
      //Decode response
      final result = value;
      print(result);
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        courseModel = CourseModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }

  // void nextScan() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   final storage = FlutterSecureStorage();
  //   CourseModel courseModel = widget.courseModel;
  //   courseModel.id_matakuliah = await storage.read(key: Constanta.keyCourseId);

  //   var requestBody = jsonEncode(courseModel.toJson());
  //   print(requestBody);
  //   CourseServices.updateData(requestBody).then((value) {
  //     //Decode response
  //     final result = value;
  //     //check status
  //     if (result.success == true && result.code == 200) {
  //       _successDialog();
  //     } else {
  //       _failedDialog();
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }).catchError((error) {
  //     String err = error.toString();
  //     print(err);
  //   });
  // }

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
