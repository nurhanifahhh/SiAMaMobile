part of 'pages.dart';

class SignInPage extends StatefulWidget {
  // static String tag = 'UserLogin';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nimController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String uid;

  UserLoginModel userLoginModel = new UserLoginModel();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void authentication() {
    UserLoginModel userLoginModel = new UserLoginModel(
        nim: nimController.text, password: passwordController.text);

    var requestBody = jsonEncode(userLoginModel.toJson());
    print(requestBody);
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        userLoginModel = UserLoginModel.fromJson(result.content);
        uid = userLoginModel.id.toString();
        print(uid);

        _storeUserData();
      } else {
        //print(requestBody);
      }
    }).catchError((error) {});
  }

  void _storeUserData() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyUserId, value: uid);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilPage()),
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
              "NIM",
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
              controller: nimController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Masukan NIM'),
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
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Masukann  password'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(size: 45, color: Colors.black)
                : RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotpassword');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
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
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: greenColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up_page');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: yellowColor,
                    child: Text(
                      'Registrasi',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
