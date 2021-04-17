part of 'pages.dart';

class ClosePage extends StatelessWidget {
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;

  ClosePage({this.onBackButtonPressed, this.child, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
          color: backColor ?? "FFFFFF".toColor(),
        )),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: "FFFFFF".toColor(),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
