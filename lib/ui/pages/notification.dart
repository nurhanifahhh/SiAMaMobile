part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          'No Notice Right Now!',
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
          "You're up-to-date! Would Work Well",
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
          Navigator.pushNamed(context, '/navigation');
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xff0C3B2E),
        child: Text(
          'Back To Dashboard',
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
