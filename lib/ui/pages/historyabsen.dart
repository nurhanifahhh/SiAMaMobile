part of 'pages.dart';

class HistoryAbsen extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const HistoryAbsen({Key key, this.userLoginModel}) : super(key: key);

  @override
  _HistoryAbsenState createState() => _HistoryAbsenState();
}

class _HistoryAbsenState extends State<HistoryAbsen> {
  UserLoginModel userLoginModel = new UserLoginModel();
  List<HistoryModel> listHistory = [];
  bool isLoading = false;

  var txttglawal = new TextEditingController();
  var txttglakhir = new TextEditingController();

  String userId = "0";
  DateTime selectedAwal = new DateTime.now();
  DateTime selectedAkhir = new DateTime.now();

  DateTime selectedTglAwal;
  DateTime selectedTglAkhir;
  DateTime selectedTgl;

  @override
  void initState() {
    readUserData();
    super.initState();
    selectedTgl = new DateTime.now();
    txttglawal.text = DateFormat('dd MMM yyy').format(selectedTgl);
    txttglakhir.text = DateFormat('dd MMM yyy').format(selectedTgl);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Absence History',
      subtitle: "Your Absence History",
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: TextField(
                    controller: txttglawal,
                    readOnly: true,
                    onTap: () {
                      chooseFirstDate();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      labelText: "Date From",
                      prefixIcon: Icon(
                        Icons.calendar_today_rounded,
                        size: 50.0,
                      ),
                    ),
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: TextField(
                    controller: txttglakhir,
                    readOnly: true,
                    onTap: () {
                      chooseLastDate();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      labelText: "Date To",
                      prefixIcon: Icon(
                        Icons.calendar_today_rounded,
                        size: 50.0,
                      ),
                    ),
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
                ),
                for (HistoryModel item in listHistory)
                  Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 120,
                    width: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.history,
                                color: Colors.green,
                                size: 50.0,
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                  item.namaMatakuliah +
                                      "\n" +
                                      DateFormat('dd MMM yyyy HH:mm')
                                          .format(item.tanggal) +
                                      "\n" +
                                      item.keterangan,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 8, defaultMargin, 8),
                ),
              ],
            ),
    );
  }

  chooseFirstDate() async {
    DateTime selectedTglAwal = await showDatePicker(
      context: context,
      initialDate: selectedTgl,
      firstDate: DateTime.now().add(new Duration(days: -365)),
      lastDate: DateTime.now().add(new Duration(days: 365)),
      helpText: 'Select First Date',
      cancelText: 'cancel',
      confirmText: 'confirm',
    );
    if (selectedTglAwal != null) {
      setState(() {
        selectedAwal = selectedTglAwal;
        txttglawal.text = DateFormat('dd MMM yyyy').format(selectedTglAwal);
      });
      listHistory.clear();
      getHistory();
    }
  }

  chooseLastDate() async {
    DateTime selectedTglAkhir = await showDatePicker(
      context: context,
      initialDate: selectedTgl,
      firstDate: DateTime.now().add(new Duration(days: -365)),
      lastDate: DateTime.now().add(new Duration(days: 365)),
      helpText: 'Select Last Date',
      cancelText: 'cancel',
      confirmText: 'confirm',
    );
    if (selectedTglAkhir != null) {
      setState(() {
        selectedAkhir = selectedTglAkhir;
        txttglakhir.text = DateFormat('dd MMM yyyy').format(selectedTglAkhir);
      });
      listHistory.clear();
      getHistory();
    }
  }

  void getHistory() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": userId,
      "startdate": selectedAwal.toString(),
      "enddate": selectedAkhir.toString(),
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    HistoryServices.getHistory(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        listHistory = List<HistoryModel>.from(
            result.content.map((x) => HistoryModel.fromJson(x)));
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": userId,
    };
    var requestBody = jsonEncode(map);
    UserLoginServices.getUserLogin(requestBody).then((value) {
      //Decode response
      final result = value;
      print(result);
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        userLoginModel = UserLoginModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }
}
