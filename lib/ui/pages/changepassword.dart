part of 'pages.dart';

class ResetPassword extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const ResetPassword({Key key, this.userLoginModel}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtoldpassword = new TextEditingController();
  TextEditingController txtnewpassword = new TextEditingController();
  TextEditingController txtrenewpassword = new TextEditingController();

  //@override
  //void initState() {
  //txtoldpassword.text = widget.userLoginModel.password;
  //txtnewpassword.text = widget.userLoginModel.password;
  //txtrenewpassword.text = widget.userLoginModel.password;

  //super.initState();
  //}

  String userId = "0";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Change Password',
      subtitle: "Don't forgot your new password",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/navigation');
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15.0),
            TextFormField(
              controller: txtoldpassword,
              obscureText: true,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: "type Your Old Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            TextFormField(
              controller: txtnewpassword,
              obscureText: true,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: "type New Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            TextFormField(
              controller: txtrenewpassword,
              obscureText: true,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: "Re-type New Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            ButtonTheme(
                buttonColor: mainColor,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    updatePassword();
                  },
                  child: Text(
                    "Change Password",
                    style: TextStyle(color: whiteColor, fontSize: 18.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void updatePassword() async {
    bool isValid = true;
    txtoldpassword.text == widget.userLoginModel.password &&
            txtnewpassword.text == txtrenewpassword.text
        ? isValid = true
        : isValid = false;
    print(widget.userLoginModel.password);

    if (isValid) {
      setState(() {
        isLoading = true;
      });
      //update password

      final storage = FlutterSecureStorage();
      UserLoginModel userLoginModel = widget.userLoginModel;
      userLoginModel.id = await storage.read(key: Constanta.keyUserId);
      userLoginModel.password = txtoldpassword.text;
      userLoginModel.password = txtnewpassword.text;
      userLoginModel.password = txtrenewpassword.text;

      var requestBody = jsonEncode(userLoginModel.toJson());
      print(requestBody);
      UserLoginServices.updateData(requestBody).then((value) {
        final result = value;
        if (result.success == true && result.code == 200) {
          _successDialog();
          isLoading = false;
        } else {}
      }).catchError((error) {
        //String err = error.toString();
      });
      print(requestBody);
    } else {
      _failedDialog();
    }
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Change Password Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your Password is Change!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationBar()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _failedDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Change Password Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Oops, something went wrong"),
                  Text("Please check all the possible mistakes"),
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
}
