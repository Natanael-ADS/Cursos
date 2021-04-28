import 'package:flutter/material.dart';
import 'package:nubank_app/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _ShowMenu;

  @override
  void initState() {
    super.initState();
    _ShowMenu = false;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          MyAppBar(
            showMenu: _ShowMenu,
            onTap: () {
              setState(() {
                _ShowMenu = !_ShowMenu;
              });
            },
          ),
          Positioned(
            top: _screenHeight * 0.17,
            height: _screenHeight * 0.55,
            left: 0,
            right: 0,
            child: SizedBox(
              height: _screenHeight * 0.03,
              child: PageView(
                children: [
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
