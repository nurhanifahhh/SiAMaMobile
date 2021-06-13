part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: Colors.white),
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        SafeArea(
            child: PageView(
          controller: PageController(),
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          children: [
            Center(
              child: SiamaPage(),
            ),
            Center(
              child: Text("Order"),
            ),
            Center(
              child: ProfilePage(),
            ),
<<<<<<< HEAD
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavbarButton(
            selectedIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            },
          ),
=======
          )
        ],
      ),
    );
  }

  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: Colors.green)),
                gradient: LinearGradient(Colors: whiteColor [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.016),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Color(0XFF00B868) : Colors.grey,
>>>>>>> c8790ca3612bf1ebdc74475d5f60ffb5c5088964
        ),
      ],
    ));
  }
}
