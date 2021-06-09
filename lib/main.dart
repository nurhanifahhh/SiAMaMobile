import 'package:flutter/material.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Changeprofil(),
        routes: <String, WidgetBuilder>{
          '/screen_page': (BuildContext context) => ScreenPage(),
          '/sign_in_page': (BuildContext context) => SignInPage(),
          '/sign_up_page': (BuildContext context) => SignUpPage(),
          '/accountcreated_page': (BuildContext context) => AccountCreated(),
          '/forgot_page': (BuildContext context) => ForgotPassword(),
          '/forgotalert_page': (BuildContext context) => ForgotPasswordAlert(),
          '/forgotpasswordverification': (BuildContext context) =>
              ForgotPasswordVerificationScreen(),
          '/home_page': (BuildContext context) => HomePage(),
          '/resetpassword': (BuildContext context) => ResetPasswordScreen(),
          '/changepassword': (BuildContext context) => ResetPassword(),
          '/changeprofil': (BuildContext context) => Changeprofil(),
        });
  }
}
