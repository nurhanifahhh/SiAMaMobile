part of 'pages.dart';

class AdminLogin extends StatefulWidget {
  // static String tag = 'UserLogin';

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController nidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String uida;

  AdminModel adminModel = new AdminModel();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void authentication() {
    AdminModel adminModel = new AdminModel(
        nid: nidController.text, password: passwordController.text);

    var requestBody = jsonEncode(adminModel.toJson());
    print(requestBody);
    AdminServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        adminModel = AdminModel.fromJson(result.content);
        uida = adminModel.id.toString();
        print(uida);

        _storeAdminData();
        nidController.text = "";
        passwordController.text = "";
        _successDialog();
      } else {
        _showDialog();
      }
    }).catchError((error) {});
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error Login"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("NID or Password is incorrect!"),
                  Text("Please enter the correct NID and Password"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Welcome to the System!"),
                  Text("Lets Start!"),
                  Text(uida),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AdminHome()),
                  );
                },
              ),
            ],
          );
        });
  }

  void sendRequestGetDataAdminLogin() {
    AdminModel adminModel = new AdminModel();
    var requestBody = jsonEncode(adminModel.toJson());
    AdminServices.getAdminLogin(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
      } else {}
    }).catchError((error) {
      String err = error.toString();
    });
  }

  void _storeAdminData() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyAdminId, value: uida);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminHome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClosePage(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Image.asset(
                  "assets/screen.png",
                  height: 150.0,
                  width: 300.0,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "NID",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "0C3B2E".toColor())),
            child: TextField(
              controller: nidController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Masukan NID'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            // color: Colors.yellow,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "0C3B2E".toColor())),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Masukann  password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      authentication();
                      //Navigator.pushNamed(context, '/si');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: newColor,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.dmSans(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
