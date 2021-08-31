import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      title: "Lista de Tarefas",
      home: page(),
    );
  }

  page() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Column(
        children: [
          Expanded(
            child: listaImagens(),
          )
        ],
      ),
    );
  }

  listaImagens() {
    return ListView(
      children: <Widget>[
        //linhaTitulo("1", "2"),
        linhaImage("1", "2"),
        //linhaTitulo("3", "4"),
        linhaImage("3", "4"),
        //linhaTitulo("5", "6"),
        linhaImage("5", "6"),
        //linhaTitulo("1", "2"),
        linhaImage("1", "2"),
        //linhaTitulo("3", "4"),
        linhaImage("3", "4"),
        //linhaTitulo("5", "6"),
        linhaImage("5", "6"),
      ],
    );
  }

  linhaImage(String index1, index2) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                imagens(index1),
                imagens(index2),
                imagens(index1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  linhaTitulo(String index1, index2) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Perfil $index1"),
          Container(width: 120),
          Text("Perfil $index2"),
        ],
      ),
    );
  }

  imagens(String index) {
    return Image.asset(
      "assets/images/perfil_$index.png",
      width: 180,
      height: 160,
    );
  }
}
