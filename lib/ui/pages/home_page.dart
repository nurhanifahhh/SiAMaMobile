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
        ),
      ],
    ));
  }
}
