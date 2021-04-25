import 'package:flutter/material.dart';
import 'package:nubank_app/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          MyAppBar(),
        ],
      ),
    );
  }
}
