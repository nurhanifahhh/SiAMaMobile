part of 'pages.dart';

class ForgotPasswordAlert extends StatefulWidget {
  @override
  _ForgotPasswordAlertState createState() => _ForgotPasswordAlertState();
}

class _ForgotPasswordAlertState extends State<ForgotPasswordAlert> {
  Widget textForgot() {
    return Column(
      children: <Widget>[
        new Center(
          child: new Image.asset(
            "assets/alert.png",
            height: 300.0,
            width: 450.0,
          ),
        ),
        Text(
          'Congratulations!!!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            // height: 3,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 180),
        Text(
          'Your password have been reset',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            // height: 2,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildContinueBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        // onPressed: () => print('Continue Pressed'),
        onPressed: () {
          Navigator.pushNamed(context, '/sign_in_page');
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xffFFB622),
        child: Text(
          'Done',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff0C3B2E)),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //buildBackBtn(),
                      //textSuccessed(),
                      textForgot(),
                      SizedBox(height: 0),
                      buildContinueBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
