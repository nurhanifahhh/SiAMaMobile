part of 'pages.dart';

class AccountCreated extends StatefulWidget {
  @override
  _AccountCreatedState createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  Widget textForgot() {
    return Column(
      children: <Widget>[
        new Center(
          child: new Image.asset(
            "assets/success.png",
            height: 300.0,
            width: 450.0,
          ),
        ),
        Text(
          'Account Created!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            // height: 3,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Text(
          'Your Account has been created successfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            // height: 2,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Press continue to start using app',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            // height: 2,
            fontSize: 14,
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
          Navigator.pushNamed(context, '/home_page');
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xff0C3B2E),
        child: Text(
          'Continue',
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
                decoration: BoxDecoration(color: Color(0xffffffff)),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //buildBackBtn()
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
