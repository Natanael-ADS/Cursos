import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:primeiro_app_flutter/member.dart';

class GitFluState extends State<GitFluWidget> {
  var _members = <Member>[];
  final _font = const TextStyle(fontSize: 20.0);

  @override
  void initState() {
    super.initState();

    _carregaDados();
  }

  _carregaDados() async {
    var url = Uri.parse("https://api.github.com/orgs/adobe/members");
    var res = await http.get(url);
    print("Response Status: ${res.statusCode}");

    setState(() {
      final _membersToJSON = jsonDecode(res.body);
      for (var m in _membersToJSON) {
        _members.add(Member(m["login"], m["avatar_url"]));
      }
    });
  }

  Widget _buildRow(int position) {
    return ListTile(
      title: Text(
        "${_members[position].login}",
        style: _font,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.greenAccent,
        backgroundImage: NetworkImage(_members[position].avatar_url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int position) {
        return _buildRow(position);
      },
    );
  }
}

class GitFluWidget extends StatefulWidget {
  @override
  createState() => GitFluState();
}
