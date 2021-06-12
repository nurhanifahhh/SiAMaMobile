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

  bool isLoading = false;
  String userId = "0";

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15.0),
            TextFormField(
              controller: txtnama,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: userLoginModel.nama,
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            TextFormField(
              controller: txtalamat,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: userLoginModel.alamat,
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            TextFormField(
              controller: txtnotelp,
              //validator: _validateEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
                hintText: userLoginModel.notelp,
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            Text(""),
            ButtonTheme(
                buttonColor: mainColor,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    updateProfile();
                  },
                  child: Text(
                    "Change Profile",
                    style: TextStyle(color: whiteColor, fontSize: 18.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void updateProfile() {
    setState(() {
      isLoading = true;
    });

    UserLoginModel userLoginModel = new UserLoginModel(
        id: widget.userLoginModel.id,
        nama: txtnama.text,
        alamat: txtalamat.text,
        notelp: txtnotelp.text
        );

    var requestBody = jsonEncode(userLoginModel.toJson());
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
                    MaterialPageRoute(builder: (context) => ProfilPage()),
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
