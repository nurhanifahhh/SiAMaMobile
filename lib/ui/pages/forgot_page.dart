part of 'pages.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Widget textForgot() {
    return Column(
      children: <Widget>[
        Text(
          'Forgot Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            // height: 3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Enter the email address associated with your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            height: 1,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget buildBackBtn() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.pushNamed(context, '/sign_in_page');
            },
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Your Email',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(260868),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.yellow),
              boxShadow: [
                // BoxShadow(
                //     color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: 'Type your email',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget buildSendBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        // onPressed: () => print('Send Pressed'),
        onPressed: () {
          Navigator.pushNamed(context, '/forgotalert_page');
        },
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xffFFC700),
        child: Text(
          'SEND',
          style: TextStyle(
              color: Color(0xff260868),
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
                      buildBackBtn(),
                      Icon(
                        Icons.lock,
                        color: Color(0xffFFB622),
                        size: 250,
                      ),
                      textForgot(),
                      SizedBox(height: 40),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildSendBtn(),
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
