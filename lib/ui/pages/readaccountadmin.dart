part of 'pages.dart';

class ReadAccountPage extends StatefulWidget {
  final AdminModel adminModel;

  const ReadAccountPage({Key key, this.adminModel}) : super(key: key);

  @override
  _ReadAccountPageState createState() => _ReadAccountPageState();
}

class _ReadAccountPageState extends State<ReadAccountPage> {
  List<UserLoginModel> listuser = [];
  bool isLoading = false;
  String adminId = "0";

  @override
  void initState() {
    super.initState();
    getReadUser();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'User Account',
      subtitle: "All User Account",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/adminhome');
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                for (UserLoginModel item in listuser)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 180,
                    width: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          width: 2.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          height: 170,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.green,
                                size: 40.0,
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                  "Nim : " +
                                      item.nim +
                                      "\n" +
                                      "Nama : " +
                                      item.nama +
                                      "\n" +
                                      "Kelas : " +
                                      item.kelas +
                                      "\n" +
                                      "Jurusan : " +
                                      item.jurusan +
                                      "\n" +
                                      "Alamat : " +
                                      item.alamat +
                                      "\n" +
                                      "No.Telp : " +
                                      item.notelp +
                                      "\n" +
                                      "Angkatan : " +
                                      item.angkatan +
                                      "\n" +
                                      "Password : " +
                                      item.password +
                                      "\n" +
                                      "Email : " +
                                      item.email,
                                  style: TextStyle(
                                    color: Colors.green,
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

  void getReadUser() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "idadmin": adminId,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    AdminServices.getListUser(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        listuser = List<UserLoginModel>.from(
            result.content.map((x) => UserLoginModel.fromJson(x)));
        setState(() {
          isLoading = false;
        });
      } else {}
    });
    //print(userLoginModel.id);
  }
}
