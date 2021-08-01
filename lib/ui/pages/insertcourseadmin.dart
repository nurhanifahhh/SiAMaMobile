part of 'pages.dart';

class InsertCourse extends StatefulWidget {
  final AdminModel adminModel;

  const InsertCourse({Key key, this.adminModel}) : super(key: key);

  @override
  _InsertCourseState createState() => _InsertCourseState();
}

class _InsertCourseState extends State<InsertCourse> {
  TextEditingController id_matakuliahController = TextEditingController();
  TextEditingController nama_matakuliahController = TextEditingController();
  TextEditingController id_jadwalkuliahController = TextEditingController();
  TextEditingController hariController = TextEditingController();
  TextEditingController tglmatkulController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  TextEditingController dosen_pengajarController = TextEditingController();

  // static String role = "user_account";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Success"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Your Account is successfully Registered!"),
                Text("Enjoy Our Service!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pushNamed(context, '/sign_in_page');
              },
            ),
          ],
        );
      },
    );
  }

  void validation() {
    CourseModel courseModel = new CourseModel(
      id_matakuliah: id_matakuliahController.text,
      nama_matakuliah: nama_matakuliahController.text,
      id_jadwalkuliah: id_jadwalkuliahController.text,
      hari: hariController.text,
      tglmatkul: tglmatkulController.text,
      waktu: waktuController.text,
      dosen_pengajar: dosen_pengajarController.text,
    );

    var requestBody = jsonEncode(courseModel.toJson());
    print(requestBody);
    CourseServices.insertData(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _showMyDialog();
      } else {}
    }).catchError((error) {
      //String err = error.toString();
    });
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Insert New Course',
      subtitle: "Make sure its valid",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/courseadminpage');
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "ID Course",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: id_matakuliahController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your ID course here'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Course Name",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: nama_matakuliahController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your course'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "ID Course Schedule",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: id_jadwalkuliahController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your course schedule'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Hari",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: hariController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type day Course'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "tgl Matkul",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: tglmatkulController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type the date course schedule'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Waktu",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: waktuController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type time'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Type dosen_pengajar",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: dosen_pengajarController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your dosen Pengajar'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                validation();
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Insert Now',
                style: whiteFontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
