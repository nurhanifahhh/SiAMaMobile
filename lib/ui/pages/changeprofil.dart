part of 'pages.dart';

class Changeprofil extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const Changeprofil({Key key, this.userLoginModel}) : super(key: key);

  @override
  _ChangeprofilState createState() => _ChangeprofilState();
}

class _ChangeprofilState extends State<Changeprofil> {
  UserLoginModel userLoginModel = new UserLoginModel();

  TextEditingController txtnama = new TextEditingController();
  TextEditingController txtalamat = new TextEditingController();
  TextEditingController txtnotelp = new TextEditingController();

  @override
  void initState() {
    txtnama.text = widget.userLoginModel.nama;
    txtalamat.text = widget.userLoginModel.alamat;
    txtnotelp.text = widget.userLoginModel.notelp;

    super.initState();
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userId = "0";
  bool isLoading = false;

  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Change Profile',
      subtitle: "Edit your profile",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/home_page');
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(margin: EdgeInsets.all(8)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtnama,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: userLoginModel.nama,
                  labelText: "Nama",
                  prefixIcon: Icon(Icons.person),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtalamat,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: userLoginModel.alamat,
                  labelText: "Address",
                  prefixIcon: Icon(Icons.location_city),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: txtnotelp,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  hintText: userLoginModel.notelp,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone_android),
                ),
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 24, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ButtonTheme(
                buttonColor: mainColor,
                minWidth: double.infinity,
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onPressed: () => updateProfile(),
                        child: Text(
                          "Change",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateProfile() async {
    setState(() {
      isLoading = true;
    });

    final storage = FlutterSecureStorage();
    UserLoginModel userLoginModel = widget.userLoginModel;
    userLoginModel.id = await storage.read(key: Constanta.keyUserId);
    userLoginModel.nama = txtnama.text;
    userLoginModel.alamat = txtalamat.text;
    userLoginModel.notelp = txtnotelp.text;

    var requestBody = jsonEncode(userLoginModel.toJson());
    print(requestBody);
    UserLoginServices.updateData(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        _successDialog();
      } else {
        _failedDialog();
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      String err = error.toString();
      print(err);
    });
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your Profile is Updated!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationBar()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _failedDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Oops, something went wrong"),
                  Text("Please check all the possible mistakes"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
