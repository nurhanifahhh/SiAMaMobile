part of 'shared.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  primaryColor: Color.fromRGBO(246, 248, 250, 1.0),
  accentColor: Color.fromRGBO(50, 50, 50, 1),
  primaryTextTheme: TextTheme(
    // Section Headings
    headline1: GoogleFonts.montserrat(
        color: Color.fromRGBO(59, 57, 60, 1),
        fontSize: 22,
        fontWeight: FontWeight.bold),

    // List Font
    bodyText1: GoogleFonts.montserrat(
        color: Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
  ),
);

ThemeData dark = ThemeData(
    primaryColor: Color.fromRGBO(31, 31, 31, 1.0),
    accentColor: Color.fromRGBO(200, 200, 200, 1),
    dividerColor: Color.fromRGBO(200, 200, 200, 0.1),
    primaryTextTheme: TextTheme(
      // Section Headings
      headline1: GoogleFonts.montserrat(
          color: Color.fromRGBO(250, 250, 250, 1),
          fontSize: 22,
          fontWeight: FontWeight.bold),

      // List Font
      bodyText1: GoogleFonts.montserrat(
          color: Color.fromRGBO(200, 200, 200, 1), fontSize: 16),
    ));
