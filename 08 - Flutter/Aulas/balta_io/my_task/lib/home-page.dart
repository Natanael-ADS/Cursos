import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_task/modules/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  var items = <Item>[];
  TextEditingController controller = TextEditingController();
  HomePage() {
    _load();
  }

  _save() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("data", jsonEncode(items));
  }

  Future _load() async {
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString("data") ?? "";

    if (data == null) {
      Iterable decoded = jsonDecode(data);
      items = decoded.map((x) => Item.FromJson(x)).toList();
    }
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

  buttonRemove(int index) => setState(() {
        widget.items.removeAt(index);
        widget._save();
      });

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
        widget._save();
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
        return Dismissible(
          key: Key(item.title),
          onDismissed: (diretion) {
            buttonRemove(index);
          },
          background: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Excluir",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.red,
          ),
          child: CheckboxListTile(
            title: Text(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value ?? false;
                widget._save();
              });
            },
          ),
        );
      },
      itemCount: widget.items.length,
    );
  }
}
