part of 'pages.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  UserLoginModel userLoginModel = new UserLoginModel();
  String userId = "0";
  bool isLoading = false;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        _signOut();
      },
    );

    // set up the AlertDialog
    AlertDialog aler = AlertDialog(
      title: Text("Alert"),
      content: Text("Are you sure want to sign out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Profile',
      subtitle: "Your Profile Account",
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/profil.png'))),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.nim ?? "",
                prefixIcon: Icon(Icons.account_circle),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.nama ?? "",
                prefixIcon: Icon(Icons.accessibility),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.kelas ?? "",
                prefixIcon: Icon(Icons.class_),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.jurusan ?? "",
                prefixIcon: Icon(Icons.article),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.alamat ?? "",
                prefixIcon: Icon(Icons.add_location),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.notelp ?? "",
                prefixIcon: Icon(Icons.call),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.angkatan ?? "",
                prefixIcon: Icon(Icons.assignment_ind_outlined),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: userLoginModel.email ?? "",
                prefixIcon: Icon(Icons.contact_mail_outlined),
              ),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 15, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ButtonTheme(
              buttonColor: mainColor,
              minWidth: double.infinity,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Changeprofil(userLoginModel: userLoginModel)));
                },
                child: Text(
                  "Change Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 15, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ButtonTheme(
              buttonColor: mainColor,
              minWidth: double.infinity,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResetPassword(userLoginModel: userLoginModel)));
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 15, left: defaultMargin, right: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ButtonTheme(
              buttonColor: mainColor,
              minWidth: double.infinity,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: () {
                  _signOut();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
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

  void _signOut() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyUserId, value: "");

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
