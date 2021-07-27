import 'package:curso/app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Page')),
        actions: [CustomSwitch()],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $counter"),
            CustomSwitch(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Line 1'), Text('Line 2')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containerTeste(),
                containerTeste(),
                containerTeste(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }

  containerTeste() {
    return Container(
      height: 50,
      width: 50,
      color: Colors.blue,
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (bool value) {
        AppController.instance.changeTheme();
      },
      value: AppController.instance.isDarkTheme,
    );
  }
}
