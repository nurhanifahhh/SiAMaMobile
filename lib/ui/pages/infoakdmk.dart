part of 'pages.dart';

class InfoAkdmkPage extends StatefulWidget {
  @override
  _InfoAkdmkPageState createState() => _InfoAkdmkPageState();
}

class _InfoAkdmkPageState extends State<InfoAkdmkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF0C3B2E),
        brightness: Brightness.dark,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context, '/navigation');
            }),
        title: Text(
          "Informasi Akademik",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            // top: 10,
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 350,
                              height: 400,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/vaksin.jpeg'))),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 350,
                              height: 400,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/pandemi.png'))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
