part of 'pages.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Calendar(),
    ListAbsensiPage(),
    ProfilPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            label: ('Home'),
            activeIcon: Icon(
              Icons.home,
              color: Colors.orange,
              size: 30, //make icon big when it is active
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.green,
            ),
            label: ('Calendar'),
            activeIcon: Icon(
              Icons.calendar_today,
              color: Colors.orange,
              size: 30, //make icon big when it is active
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
              color: Colors.green,
            ),
            label: ('Scan QR Code'),
            activeIcon: Icon(
              Icons.qr_code_scanner,
              color: Colors.orange,
              size: 30, //make icon big when it is active
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity_rounded,
              color: Colors.green,
            ),
            label: ('Profile'),
            activeIcon: Icon(
              Icons.perm_identity_rounded,
              color: Colors.orange,
              size: 30, //make icon big when it is active
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
