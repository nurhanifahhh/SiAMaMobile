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
  bool isLoading = false;
  String qrCodeData = "Default";
  CourseModel courseModel = new CourseModel();
  String courseId = "0";
  String userId = "0";
  double latitude;
  double longtitude;
  String ket = "Hadir";

  LocationModel locModel = new LocationModel();

  @override
  void initState() {
    readUserData();
    readCourseData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
    print(userId);
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
      } else {}
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
        print("berhasil");
        print(result.content);
      } else {}
    }).catchError((error) {});
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
                  hintText: courseModel.nama_matakuliah,
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
                  hintText: courseModel.hari,
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
                          if (results != null &&
                              results.containsKey('qrcode')) {
                            setState(() {
                              qrCodeData = results['qrcode'];
                            });
                            verifLocation();
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
}
