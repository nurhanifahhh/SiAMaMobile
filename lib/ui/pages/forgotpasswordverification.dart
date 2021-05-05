part of 'pages.dart';

class ForgotPasswordVerificationScreen extends StatefulWidget {
  final VerificationCodeModel verificationCodeModel;
  const ForgotPasswordVerificationScreen({Key key, this.verificationCodeModel})
      : super(key: key);

  @override
  _ForgotPasswordVerificationScreenState createState() =>
      _ForgotPasswordVerificationScreenState();
}

class _ForgotPasswordVerificationScreenState
    extends State<ForgotPasswordVerificationScreen> {
  TextEditingController txtCode = new TextEditingController();
  VerificationCodeModel _verificationEmail = new VerificationCodeModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Reset Password',
      subtitle: "Please enter verification code",
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
            new Icon(Icons.lock, size: 180.0, color: mainColor),
            Text(
                "Please Enter 6 Digit Verification Code Which is Sent to Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18)),
            Text(""),
            TextFormField(
              controller: txtCode,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: "PIN",
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
                    verifyCode();
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void verifyCode() {
    _verificationEmail = widget.verificationCodeModel;
    if (txtCode.text ==
        widget.verificationCodeModel.verificationCode.toString()) {
      //sendNewPassword();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResetPassword(verificationEmail: _verificationEmail)));
    } else {
      print("Your Verification Code is Invalid");
    }
  }
}
