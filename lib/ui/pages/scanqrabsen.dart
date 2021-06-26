part of 'pages.dart';

class ScanQRAbsen extends StatefulWidget {
  @override
  _ScanQRAbsenState createState() => _ScanQRAbsenState();
}

class _ScanQRAbsenState extends State<ScanQRAbsen> {
  String barcode = "";
  String qrCodeResult =
      "Qrcode Result goes here after scanning. For dev purposes"; //result goes here after scanning.

  @override
  initState() {
    super.initState();
    _checkPermission(); //if the apps newly installed, we need to ask for permission to access camera.
  }

  Future<void> _checkPermission() async {
    if (await Permission.camera.request().isGranted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 230,
            //so this is container which is parent of purple container
            //this is parent of purple container
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/header_home.png'),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  //container
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.qr_code_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        Text("QR Code based attendance",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        //i use spacer class which fill all space btw column and icon
                        //which i am going to create
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text("Scan QR Code Your Course",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
          ),
          Text(this.qrCodeResult,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Container(
            margin: EdgeInsets.only(
                top: 15, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ButtonTheme(
              buttonColor: blueColor,
              minWidth: double.infinity,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: () async {
                  this.qrCodeResult = await scanner.scan();
                  print(this.qrCodeResult);
                  setState(() {});
                },
                child: Text(
                  "Scan QR",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Container(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
                top: 15, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ButtonTheme(
              buttonColor: blueColor,
              minWidth: double.infinity,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: () async {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Navigation()));
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> ScanQRAbsen() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //         '#fff', 'Cancel', true, ScanMode.QR);

  //     if (!mounted) return;

  //     setState(() {
  //       this.qrCodeResult = qrCode;

  //       print(this.qrCodeResult);
  //     });
  //   } on PlatformException {
  //     this.qrCodeResult = 'Failed to get platform version.';
  //   }
  // }
}
