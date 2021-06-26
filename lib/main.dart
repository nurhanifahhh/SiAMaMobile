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
        home: ScreenPage(),
        routes: <String, WidgetBuilder>{
          '/screen_page': (BuildContext context) => ScreenPage(),
          '/sign_in_page': (BuildContext context) => SignInPage(),
          '/sign_up_page': (BuildContext context) => SignUpPage(),
          '/forgot_page': (BuildContext context) => ForgotPassword(),
          '/forgotalert_page': (BuildContext context) => ForgotPasswordAlert(),
          '/forgotpasswordverification': (BuildContext context) =>
              ForgotPasswordVerificationScreen(),
          '/home_page': (BuildContext context) => HomePage(),
          '/resetpassword': (BuildContext context) => ResetPasswordScreen(),
          '/changepassword': (BuildContext context) => ResetPassword(),
          '/changeprofil': (BuildContext context) => Changeprofil(),
          '/profileuser': (BuildContext context) => ProfilPage(),
          '/loginadmin': (BuildContext context) => AdminLogin(),
          '/adminhome': (BuildContext context) => AdminHome(),
          '/rekap_absen': (BuildContext context) => RekapAbsenPage(),
          '/hasil_rekap_absen': (BuildContext context) => HasilRekapAbsenPage(),
          '/navigation': (BuildContext context) => NavigationBar(),
          '/chatscreen': (BuildContext context) => ChatScreen(),
          '/listabsenpage': (BuildContext context) => ListAbsensiPage(),
          '/getlocator': (BuildContext context) => GetLocator(),
          '/profile_page': (BuildContext context) => ProfilePage(),
          '/scanqrabsen': (BuildContext context) => ScanQRAbsen(),
        });
  }
}
