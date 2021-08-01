part of 'pages.dart';

class HistoryAbsenPage extends StatefulWidget {
  final AdminModel adminModel;

  const HistoryAbsenPage({Key key, this.adminModel}) : super(key: key);

  @override
  _HistoryAbsenPageState createState() => _HistoryAbsenPageState();
}

class _HistoryAbsenPageState extends State<HistoryAbsenPage> {
  List<HistoryModel> listHistory = [];
  bool isLoading = false;
  String adminId = "0";

  @override
  void initState() {
    super.initState();
    readHistory();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Absence History',
      subtitle: "All Absence History",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/adminhome');
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                for (HistoryModel item in listHistory)
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    height: 120,
                    width: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
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
                                size: 40.0,
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                  "ID Absen : " +
                                      item.idAbsen +
                                      "\n" +
                                      "Nim : " +
                                      item.nim +
                                      "\n" +
                                      "Nama Matakuliah : " +
                                      item.namaMatakuliah +
                                      "\n" +
                                      "Tanggal : " +
                                      DateFormat('dd MMM yyyy HH:mm')
                                          .format(item.tanggal) +
                                      "\n" +
                                      "Keterangan : " +
                                      item.keterangan,
                                  style: TextStyle(
                                    color: Colors.black,
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

  void readHistory() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": adminId,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    AdminServices.readAllHistory(requestBody).then((value) {
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
}
