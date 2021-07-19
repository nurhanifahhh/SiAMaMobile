part of 'pages.dart';

class JadwalKuliah extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const JadwalKuliah({Key key, this.userLoginModel}) : super(key: key);

  @override
  _JadwalKuliahState createState() => _JadwalKuliahState();
}

class _JadwalKuliahState extends State<JadwalKuliah> {
  UserLoginModel userLoginModel = new UserLoginModel();
  List<CourseModel> listcourse = [];
  bool isLoading = false;

  String userId = "0";

  @override
  void initState() {
    readUserData();
    super.initState();
    getCourse();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'course schedule',
      subtitle: "Your course schedule",
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                for (CourseModel item in listcourse)
                  Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 120,
                    width: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.import_contacts,
                                color: Colors.green,
                                size: 50.0,
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                  item.nama_matakuliah +
                                      "\n" +
                                      item.hari +
                                      "\n" +
                                      item.waktu +
                                      "\n" +
                                      item.dosen_pengajar,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
                ),
              ],
            ),
    );
  }

  void getCourse() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": userId,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    CourseServices.getAllCourse(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        listcourse = List<CourseModel>.from(
            result.content.map((x) => CourseModel.fromJson(x)));
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": userId,
    };
    var requestBody = jsonEncode(map);
    UserLoginServices.getUserLogin(requestBody).then((value) {
      //Decode response
      final result = value;
      print(result);
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        userLoginModel = UserLoginModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }
}
