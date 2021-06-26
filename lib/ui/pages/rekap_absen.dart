part of 'pages.dart';

class RekapAbsenPage extends StatefulWidget {
  @override
  _RekapAbsenPageState createState() => _RekapAbsenPageState();
}

class _RekapAbsenPageState extends State<RekapAbsenPage> {
  TextEditingController nimController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Rekap Absensi Mahasiswa',
      subtitle: "Cari Absensi Mahasiswa",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/adminhome');
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "NIM",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: nimController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type search NIM'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Tanggal",
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: tanggalController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: whiteFontStyle3,
                  hintText: 'Input the date'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hasil_rekap_absen');
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Search Now!',
                style: whiteFontStyle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adminhome');
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Back',
                style: whiteFontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
