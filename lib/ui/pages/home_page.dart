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
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(
                        Icons.notifications,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 2,
                // ),
                // Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/profil.png'))),
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
                            userLoginModel.nama ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            userLoginModel.nim ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            userLoginModel.kelas ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
            top: 190,
            height: MediaQuery.of(context).size.height - 250,
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Jadwal Hari Ini",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/imk.png'))),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 200,
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
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoryAbsen()));
                              },
                              child: Container(
                                // color: Color(0xFFBDBDBD),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/absen.png'))),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Riwayat Absen",
                                        style: TextStyle(
                                          color: Colors.green,
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
                                        builder: (context) => JadwalKuliah()));
                              },
                              child: Container(
                                // color: Color(0xFFBDBDBD),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/jadwalkuliah.png'))),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Jadwal Kuliah",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 5.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 3.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new CupertinoPageRoute(
                                        builder: (context) => KhsPage()));
                              },
                              child: Container(
                                // color: Color(0xFFBDBDBD),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/khs.png'))),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("KHS",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new CupertinoPageRoute(
                                        builder: (context) => ProfilePage()));
                              },
                              child: Container(
                                // color: Color(0xFFBDBDBD),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/profkmpus.png'))),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    new Text("Profil Kampus",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 5.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new CupertinoPageRoute(
                                        builder: (context) => InfoAkdmkPage()));
                              },
                              child: Container(
                                // color: Color(0xFFBDBDBD),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/infoakademik.png'))),
                                    ),
                                    new SizedBox(
                                      width: 5.0,
                                    ),
                                    new Text("Informasi Akademik",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
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
        print(userLoginModel.id);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }
}
