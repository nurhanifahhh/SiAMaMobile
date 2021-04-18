part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // static String role = "user_account";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Success"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Your Account is successfully Registered!"),
                Text("Enjoy Our Service!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pushNamed(context, '/sign_in_page');
              },
            ),
          ],
        );
      },
    );
  }

  void validation() {
    UserLoginModel userLoginModel = new UserLoginModel(
      nim: nimController.text,
      nama: namaController.text,
      kelas: kelasController.text,
      jurusan: jurusanController.text,
      alamat: alamatController.text,
      notelp: notelpController.text,
      angkatan: angkatanController.text,
      password: passwordController.text,
      email: emailController.text,
    );

    var requestBody = jsonEncode(userLoginModel.toJson());
    print(requestBody);
    UserLoginServices.insertData(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _showMyDialog();
      } else {}
    }).catchError((error) {
      //String err = error.toString();
    });
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Registrasi',
      subtitle: "Make sure its valid",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/sign_in_page');
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Full Name",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: namaController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your name here'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: nimController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your NIM'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Email Address",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your email'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: alamatController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Phone Number",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: notelpController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your phone number'),
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
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Type your year generation",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: angkatanController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your year generation'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Type your class",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: kelasController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your class'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Type your college major",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: jurusanController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your college major'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                validation();
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Sign Up Now',
                style: whiteFontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
