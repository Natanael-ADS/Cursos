import 'package:flutter/material.dart';

import 'mywidget.dart';

//pode ser usado assim tambem {void main() ==> runApp(MyApp());}
void main() {
  runApp(GitFluApp());
}

class GitFluApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu Primeiro App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Titulo do app"),
        ),
        body: Center(
          child: GitFluWidget(),
        ),
      ),
    );
  }
}
