import 'package:curso/app_controller.dart';
import 'package:curso/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, Widget child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.light
                  : Brightness.dark),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/HomePage': (context) => HomePage()
          },
        );
      },
    );
  }
}
