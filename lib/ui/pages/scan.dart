part of 'pages.dart';

class ScanQrCode extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const ScanQrCode({Key key, this.userLoginModel}) : super(key: key);

  @override
  _ScanQrCodeState createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  UserLoginModel userLoginModel = new UserLoginModel();
  AbsensiModel absensiModel = new AbsensiModel();
  CourseModel courseModel = new CourseModel();
  LocationModel locModel = new LocationModel();
  bool isLoading = false;
  String qrCodeData = "";
  String courseId = "0";
  String userId = "0";
  String name = "kosong";
  double latitude;
  double longtitude;
  String ket = "Hadir";

  @override
  void initState() {
    readUserData();
    readCourseData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longtitude = position.longitude;
  }

  void verifLocation() {
    LocationModel locModel =
        new LocationModel(latitude: latitude, longtitude: longtitude);

    var requestBody = jsonEncode(locModel.toJson());
    print(requestBody);
    UserLoginServices.checkLocation(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        savePresence();
      } else {
        _showLocErr();
      }
    }).catchError((error) {});
  }

  void savePresence() {
    AbsensiModel absensiModel =
        new AbsensiModel(iduser: userId, idmatkul: courseId, keterangan: ket);
    var requestBody = jsonEncode(absensiModel.toJson());
    print(requestBody);
    UserLoginServices.savePresence(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        print("absen sukses");
        _successDialog();
      } else {
        _showErrorAbsen();
      }
    }).catchError((error) {});
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Presence Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Absen Success!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavigationBar()));
                },
              ),
            ],
          );
        });
  }

  Future<void> _showError() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error Absen"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your QR Code is Invalid!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListAbsensiPage()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _showLocErr() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error Absen"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your distance between CheckPoint is Rejected!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationBar()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _showErrorAbsen() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error Presence"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Presence Failed!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListAbsensiPage()),
                  );
                },
              ),
            ],
          );
        });
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Your Data Absensi',
      subtitle: "Please Scanning QR Code",
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                readOnly: true,
                // controller: txtnamamatkul,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: userId,
                  // labelText: courseModel.nama_matakuliah ?? "",
                  prefixIcon: Icon(Icons.book_online),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
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
                  hintText: courseModel.nama_matakuliah ?? "",
                  // labelText: courseModel.nama_matakuliah ?? "",
                  prefixIcon: Icon(Icons.book_online),
                ),
                style: TextStyle(color: Colors.black87),
              ),
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
                  hintText: courseModel.hari ?? "",
                  // labelText: courseModel.hari ?? "",
                  prefixIcon: Icon(Icons.calendar_today),
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
                // controller: txttanggal,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.tglmatkul ?? "",
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
                  hintText: courseModel.waktu ?? "",
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
                  hintText: courseModel.dosen_pengajar ?? "",
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
                  hintText: qrCodeData,
                  // labelText: courseModel.dosen_pengajar ?? "",
                  prefixIcon: Icon(Icons.qr_code),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 5),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? SpinKitFadingCircle(
                      size: 45,
                      color: mainColor,
                    )
                  : RaisedButton(
                      onPressed: () {
                        getCurrentLocation();
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanQrCodePage()))
                            .then((results) {
                          String locPoltek = "1.118673,104.048442";
                          setState(() {
                            this.qrCodeData = results['qrcode'];
                          });
                          print(this.qrCodeData);
                          if (this.qrCodeData == locPoltek) {
                            verifLocation();
                          } else {
                            _showError();
                          }
                        });
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: newColor,
                      child: Text(
                        'Scan',
                        style: GoogleFonts.dmSans(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
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
      "id_matakuliah": courseId,
    };
    var requestBody = jsonEncode(map);
    CourseServices.getCourse(requestBody).then((value) {
      //Decode response
      final result = value;
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
}
