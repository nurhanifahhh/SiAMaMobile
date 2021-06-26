part of 'pages.dart';

class ListAbsensiPage extends StatefulWidget {
  @override
  _ListAbsensiPageState createState() => _ListAbsensiPageState();
}

class _ListAbsensiPageState extends State<ListAbsensiPage> {
  TextEditingController id_matakuliahController = TextEditingController();
  bool isLoading = false;
  String uidc;

  CourseModel courseModel = new CourseModel();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void authentication() {
    CourseModel courseModel =
        new CourseModel(id_matakuliah: id_matakuliahController.text);

    var requestBody = jsonEncode(courseModel.toJson());
    print(requestBody);
    CourseServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        courseModel = CourseModel.fromJson(result.content);
        uidc = courseModel.id_matakuliah.toString();
        print(uidc);

        _storeCourseData();
        id_matakuliahController.text = "";
        _successDialog();
      } else {
        _showDialog();
      }
    }).catchError((error) {});
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error Code Course"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Code Course is incorrect!"),
                  Text("Please enter the correct Code Course"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Code Course Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("please be absent"),
                  Text("Lets Start!"),
                  Text(uidc),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NavigationBar()),
                  // );
                },
              ),
            ],
          );
        });
  }

  void sendRequestGetDataCourse() {
    CourseModel courseModel = new CourseModel();
    var requestBody = jsonEncode(courseModel.toJson());
    CourseServices.getCourse(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
      } else {}
    }).catchError((error) {
      String err = error.toString();
    });
  }

  void _storeCourseData() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyCourseId, value: uidc);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetLocator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Absensi',
      subtitle: "List Your Absen Before Scanning QR Code",
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Please Fill In Correctly",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFFFFF".toColor())),
            child: TextField(
              controller: id_matakuliahController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Your Course Code'),
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
                      authentication();
                      //Navigator.pushNamed(context, '/si');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: newColor,
                    child: Text(
                      'Next',
                      style: GoogleFonts.dmSans(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
