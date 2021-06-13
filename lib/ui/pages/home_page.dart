part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.lock_outline, 1),
          buildNavBarItem(Icons.qr_code_scanner, 2),
          buildNavBarItem(Icons.perm_identity_rounded, 3),
        ],
      ),
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
                    Icon(
                      Icons.menu,
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
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "HELLO, NURHANIFAH \n 3311911037",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/profil.png'))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            height: MediaQuery.of(context).size.height - 230,
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
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
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
                        // SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildExpenseBotton(
                                Icons.home, "Profil Kampus", true),
                            buildExpenseBotton(
                                Icons.access_alarm, "Jadwal Kuliah", true),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildExpenseBotton(
                                Icons.article_sharp, "KHS", true),
                            buildExpenseBotton(
                                Icons.check_box_rounded, "Absensi", true),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildExpenseBotton(Icons.account_balance,
                                "Informasi Akademik", true),
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

  Container buildExpenseBotton(IconData icon, String title, bool isActive) {
    return Container(
      height: 80,
      width: 170,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Color(0XFF00B686) : Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isActive ? Color(0XFF00B686) : Colors.white,
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: Colors.green)),
                // gradient: LinearGradient(colors: [
                //   Colors.green.withOpacity(0.3),
                //   Colors.green.withOpacity(0.016),
                // ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Color(0XFF00B868) : Colors.grey,
        ),
      ),
    );
  }
}
