part of 'pages.dart';

class CourseAdminPage extends StatefulWidget {
  final AdminModel adminModel;

  const CourseAdminPage({Key key, this.adminModel}) : super(key: key);

  @override
  _CourseAdminPageState createState() => _CourseAdminPageState();
}

class _CourseAdminPageState extends State<CourseAdminPage> {
  AdminModel adminModel = new AdminModel();
  CourseModel courseModel = new CourseModel();
  List<CourseModel> listcourse = [];
  bool isLoading = false;
  String adminId = "0";

  @override
  void initState() {
    super.initState();
    getCourse();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'course schedule',
      subtitle: "All course schedule",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/adminhome');
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InsertCourse(adminModel: adminModel)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 220,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("Insert",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
                ),
                for (CourseModel item in listcourse)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManageCoursePage(
                                  idCourse: item.id_matakuliah.toString())));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 80,
                      width: 370,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 70,
                            width: 360,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new SizedBox(
                                  width: 3.0,
                                ),
                                new Text(
                                    "ID Matakuliah : " +
                                        item.id_matakuliah +
                                        "\n" +
                                        "Nama Matakuliah : " +
                                        item.nama_matakuliah,
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
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
      "id": adminId,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    AdminServices.getAllCourse(requestBody).then((value) {
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
}
