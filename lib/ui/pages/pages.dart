import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:siamauji1/shared/shared.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'general_page.dart';
part 'screen_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'listabsenpage.dart';
part 'forgotpassword.dart';
part 'close_app.dart';
part 'home_page.dart';
part 'profile_page.dart';
part 'forgotpasswordverification.dart';
part 'resetpassword.dart';
part 'changepassword.dart';
part 'profileuser.dart';
part 'changeprofil.dart';
part 'navigation.dart';
part 'adminhome.dart';
part 'calendar.dart';
part 'notification.dart';
part 'loginadmin.dart';
part 'scan.dart';
part 'scanqrcodepage.dart';
part 'infoakdmk.dart';
part 'khs.dart';
part 'historyabsen.dart';
part 'jadwalkuliah.dart';
part 'readabsenadmin.dart';
part 'courseadminpage.dart';
part 'readaccountadmin.dart';
part 'managecourseadmin.dart';
part 'insertcourseadmin.dart';

part 'package:siamauji1/models/userloginmodel.dart';
part 'package:siamauji1/models/adminmodel.dart';
part 'package:siamauji1/models/constanta.dart';
part 'package:siamauji1/service/userloginservices.dart';
part 'package:siamauji1/service/adminservice.dart';
part 'package:siamauji1/service/absensiservice.dart';
part 'package:siamauji1/service/courseservice.dart';
part 'package:siamauji1/service/historyservice.dart';
part 'package:siamauji1/service/apiresponse.dart';
part 'package:siamauji1/service/baseapiservices.dart';
part 'package:siamauji1/models/verificationmodel.dart';
part 'package:siamauji1/models/adminmessage.dart';
part 'package:siamauji1/models/message_model.dart';
part 'package:siamauji1/models/calendar_model.dart';
part 'package:siamauji1/models/coursemodel.dart';
part 'package:siamauji1/models/locationmodel.dart';
part 'package:siamauji1/models/absenmodel.dart';
part 'package:siamauji1/models/historymodel.dart';
