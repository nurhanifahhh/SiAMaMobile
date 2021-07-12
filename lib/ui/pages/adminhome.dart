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
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: new AppBar(
        backgroundColor: Color(0xFF0C3B2E),
        title: new Text("App Admin"),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          child: IconButton(
            icon: new Icon(
              Icons.search,
            ),
            onPressed: () {
              _signOut();
            },
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  icon: new Icon(
                    Icons.logout,
                  ),
                  onPressed: () {
                    _signOut();
                  },
                  color: Colors.white,
                ),
              )),
        ],
      ),
      //drawer: new Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context).push(new CupertinoPageRoute(
                  //       builder: (context) => AppUsers()));
                  // },
                  child: new CircleAvatar(
                    backgroundColor: Color(0xFF0C3B2E),
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.history,
                          color: Colors.green,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Absensi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context).push(new CupertinoPageRoute(
                  //       builder: (context) => AppOrders()));
                  // },
                  child: new CircleAvatar(
                    backgroundColor: Color(0xFF0C3B2E),
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.notifications,
                          color: Colors.green,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Course List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context).push(new CupertinoPageRoute(
                  //       builder: (context) => AppMessages()));
                  // },
                  child: new CircleAvatar(
                    backgroundColor: Color(0xFF0C3B2E),
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.chat,
                          color: Colors.green,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Messages",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context).push(new CupertinoPageRoute(
                  //       builder: (context) => OrderHistory()));
                  // },
                  child: new CircleAvatar(
                    backgroundColor: Color(0xFF0C3B2E),
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.grade_outlined,
                          color: Colors.green,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Course Grades",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context).push(new CupertinoPageRoute(
                  //       builder: (context) => AppProducts()));
                  // },
                  child: new CircleAvatar(
                    backgroundColor: Color(0xFF0C3B2E),
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Account Users",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
