part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: 'Profile Kampus',
        subtitle: "Visi & Misi",
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/sign_in_page');
        },
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/profil.png'))),
                    ),
                    Text(
                      "Menjadi politeknik generasi baru yang bermutu adaptif inovatif dan bermitra erat dengan industri dan masyarakat untuk mendukung indonesia Maju dan Sejahtera 2045",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/profil.png'))),
                    ),
                    Text(
                      "Menjadi politeknik generasi baru yang bermutu adaptif inovatif dan bermitra erat dengan industri dan masyarakat untuk mendukung indonesia Maju dan Sejahtera 2045",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ])
        // child: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8),
        //           border: Border.all(color: "ff0C3B2E".toColor())),
        //       child: TextField(
        //         controller: nameController,
        //         decoration: InputDecoration(
        //             border: InputBorder.none,
        //             hintStyle: whiteFontStyle3,
        //             hintText: 'VISI'),
        //       ),
        //       child: TextField(
        //         controller: nameController,
        //         decoration: InputDecoration(
        //             border: InputBorder.none,
        //             hintStyle: whiteFontStyle3,
        //             hintText: 'Menjadi politeknik generasi baru yang bermutu,
        //             adaptif, inovatif dan bermitra erat dengan industri dan masyarakat untuk mendukung
        //             indonesia Maju dan Sejahtera 2045'),
        //       ),
        //     ),
        //     SizedBox(height: 40),
        //     Container(
        //       width: double.infinity,
        //       margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8),
        //           border: Border.all(color: "ff0C3B2E".toColor())),
        //       child: TextField(
        //         controller: nameController,
        //         decoration: InputDecoration(
        //             border: InputBorder.none,
        //             hintStyle: whiteFontStyle3,
        //             hintText: 'MISI'),
        //       ),
        //       child: TextField(
        //         controller: nameController,
        //         decoration: InputDecoration(
        //             border: InputBorder.none,
        //             hintStyle: whiteFontStyle3,
        //             hintText: 'Aktif dalam proses kreasi, penyebaran dan penerapan sains
        //             dan teknologi melalui layanan pendidikan tinggi vokasi dan penelitian
        //             terapan yang bermutu, terbuka, relevan, dan berkolaborasi erat dengan
        //             masyarakat dan industri dengan penerapan tata kelola institusi yang
        //             baik untuk kehidupan bangsa yang lebih baik'),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
