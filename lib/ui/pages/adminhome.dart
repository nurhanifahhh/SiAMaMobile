part of 'pages.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  AdminModel adminModel = new AdminModel();
  String adminId = "0";
  bool isLoading = false;

  @override
  void initState() {
    readAdminData();
    super.initState();
  }

  Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            color: (Color(0xFF0C3B2E)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dashboard Admin",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(
                        Icons.logout,
                      ),
                      onPressed: () {
                        _signOut();
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/header2.jpeg'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hello,",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            adminModel.nid ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 220,
            height: MediaQuery.of(context).size.height - 150,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListView(
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoryAbsenPage(
                                            adminModel: adminModel)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 150,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.history,
                                      color: Colors.yellow,
                                      size: 40.0,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("List Absensi",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseAdminPage(
                                            adminModel: adminModel)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 150,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.notifications,
                                      color: Colors.yellow,
                                      size: 40.0,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("List Course",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadAccountPage(
                                            adminModel: adminModel)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 150,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.person,
                                      color: Colors.yellow,
                                      size: 40.0,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Account Users",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void readAdminData() async {
    final storage = FlutterSecureStorage();
    adminId = await storage.read(key: Constanta.keyAdminId);
    getDataAdminLogin();
  }

  void getDataAdminLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": adminId,
    };
    var requestBody = jsonEncode(map);
    AdminServices.getAdminLogin(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        adminModel = AdminModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }

  void _signOut() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyAdminId, value: "");

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
