part of 'pages.dart';

class ResetPasswordScreen extends StatefulWidget {
  final VerificationCodeModel verificationEmail;
  const ResetPasswordScreen({Key key, this.verificationEmail})
      : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtRePassword = new TextEditingController();

  bool isChangePassword = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Create New Password',
      subtitle: "Please enter new password for your account",
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            new Icon(Icons.lock_open, size: 100.0, color: mainColor),
            Text("Please Change Your Password",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: mainColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: "Type new password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Text(""),
            TextFormField(
              controller: txtRePassword,
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
                hintText: "Retype new password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Text(""),
            ButtonTheme(
                buttonColor: mainColor,
                minWidth: double.infinity,
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    resetPassword();
                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void resetPassword() {
    String emailAddress;
    emailAddress = widget.verificationEmail.email.toString();
    Map map = {"email": emailAddress, "password": txtRePassword.text};
    var requestBody = jsonEncode(map);
    UserLoginServices.changePassword(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _showSuccess();
      } else {
        //_showError();
        _handledVerifError(
            "Failed to Send Verification Code, message: " + result.message);
      }
    }).catchError((error) {
      _handledVerifError(
          "Failed to Send Verification Code, message: " + error.toString());
    });
    print(requestBody);
  }

  void _handledVerifError(String errorMessage) {
    //Dialog.showAlertMessage(errorMessage, context);
    print(errorMessage);
    if (!mounted) return;
    setState(() {
      isChangePassword = false;
    });
  }

  Future<void> _showSuccess() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Password is Changed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Make sure your account is successfully recover"),
                  Text("Please login using your new password"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
              ),
            ],
          );
        });
  }
}
