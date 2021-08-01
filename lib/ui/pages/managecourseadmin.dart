part of 'pages.dart';

class ManageCoursePage extends StatefulWidget {
  final String idCourse;

  const ManageCoursePage({Key key, this.idCourse}) : super(key: key);

  @override
  _ManageCoursePageState createState() => _ManageCoursePageState();
}

class _ManageCoursePageState extends State<ManageCoursePage> {
  bool isLoading = false;
  String adminId = "0";
  String courseId = "0";
  CourseModel courseModel = new CourseModel();

  TextEditingController txthari = new TextEditingController();
  TextEditingController txttglmatkul = new TextEditingController();
  TextEditingController txtwaktu = new TextEditingController();

  @override
  void initState() {
    getDataCourse();
    super.initState();
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Change Course',
      subtitle: "Edit Course",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/courseadminpage');
      },
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
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.nama_matakuliah,
                  // labelText: "Nama",
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
                controller: txthari,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.hari,
                  // labelText: "Course's Day",
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
                controller: txttglmatkul,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.tglmatkul,
                  // labelText: "Course's Date",
                  prefixIcon: Icon(Icons.date_range_outlined),
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
                controller: txtwaktu,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: courseModel.waktu,
                  // labelText: "Course's Time",
                  prefixIcon: Icon(Icons.timer_rounded),
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
                        onPressed: () => updateProfile(),
                        child: Text(
                          "Change",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getDataCourse() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id_matakuliah": widget.idCourse,
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

  void updateProfile() async {
    setState(() {
      isLoading = true;
    });

    courseModel.id_matakuliah = widget.idCourse;
    courseModel.hari = txthari.text;
    courseModel.tglmatkul = txttglmatkul.text;
    courseModel.waktu = txtwaktu.text;

    var requestBody = jsonEncode(courseModel.toJson());
    print(requestBody);
    CourseServices.updateData(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        _successDialog();
      } else {
        _failedDialog();
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      String err = error.toString();
      print(err);
    });
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Course Data is Updated!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CourseAdminPage()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _failedDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Oops, something went wrong"),
                  Text("Please check all the possible mistakes"),
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
}
