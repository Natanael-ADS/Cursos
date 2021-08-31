import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home-page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Task",
      theme: ThemeData(primaryColor: Colors.green),
      home: HomePage(),
    );
  }
}
