import 'package:flutter/material.dart';
import 'package:my_task/modules/item.dart';

class HomePage extends StatefulWidget {
  var items = <Item>[];
  TextEditingController controller = TextEditingController();
  HomePage() {
    items.add(Item(title: "Task 01", done: false));
    items.add(Item(title: "Task 02", done: false));
    items.add(Item(title: "Task 03", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: insertItem(),
      body: listItems(),
      floatingActionButton: buttonFloating(),
    );
  }

  buttonFloating() {
    btn() {
      final con = widget.controller;

      if (con.text == "") {
        return;
      }
      setState(() {
        Item item = Item(title: con.text, done: false);
        final lista = widget.items;

        lista.add(item);
        con.clear();
      });
    }

    return FloatingActionButton(
      onPressed: btn,
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    );
  }

  insertItem() {
    var inD = InputDecoration(
      labelStyle: TextStyle(color: Colors.white),
      labelText: "Please input with your task!",
    );

    var textForm = TextFormField(
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      decoration: inD,
    );

    return AppBar(
      title: textForm,
    );
  }

  Widget listItems() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return CheckboxListTile(
          title: Text(item.title),
          value: item.done,
          onChanged: (value) {
            setState(() {
              item.done = value ?? false;
            });
          },
        );
      },
      itemCount: widget.items.length,
    );
  }
}
