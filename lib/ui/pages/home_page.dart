part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserLoginModel userLoginModel = new UserLoginModel();
  String userId = "0";
  bool isLoading = false;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

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
                    IconButton(
                      icon: new Icon(
                        Icons.message_outlined,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      color: Colors.white,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 2,
                // ),
                // Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/profil.png'))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      userLoginModel.nama ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      userLoginModel.nim ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 240,
            height: MediaQuery.of(context).size.height - 300,
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jadwal Hari Ini",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 220,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/imk.png'))),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 220,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/rpl.png'))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListView(
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        new SizedBox(
                          height: 2.0,
                        ),
                        // SizedBox(height: 5),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(new CupertinoPageRoute(
                              //       builder: (context) => Privilages()));
                              // },
                              child: new CircleAvatar(
                                backgroundColor: Color(0xFFBDBDBD),
                                maxRadius: 50.0,
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
                                    new Text("Riwayat Absen",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 13,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            new GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(new CupertinoPageRoute(
                              //       builder: (context) => AppUsers()));
                              // },
                              child: new CircleAvatar(
                                backgroundColor: Color(0xFFBDBDBD),
                                maxRadius: 50.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.access_alarm,
                                      color: Colors.green,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Jadwal Kuliah",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 2.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(new CupertinoPageRoute(
                              //       builder: (context) => Privilages()));
                              // },
                              child: new CircleAvatar(
                                backgroundColor: Color(0xFFBDBDBD),
                                maxRadius: 50.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.article_sharp,
                                      color: Colors.green,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("KHS",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            new GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(new CupertinoPageRoute(
                              //       builder: (context) => AppUsers()));
                              // },
                              child: new CircleAvatar(
                                backgroundColor: Color(0xFFBDBDBD),
                                maxRadius: 50.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.account_balance,
                                      color: Colors.green,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Informasi \nAkademik",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 2.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new CupertinoPageRoute(
                                        builder: (context) => ProfilePage()));
                              },
                              child: new CircleAvatar(
                                backgroundColor: Color(0xFFBDBDBD),
                                maxRadius: 50.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.home,
                                      color: Colors.green,
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Profil Kampus",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
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
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        userLoginModel = UserLoginModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }
}
