import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/Tarefa.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Tarefa tarefa = Tarefa();
  List<Tarefa> lista = <Tarefa>[];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: vAppBar(),
        body: vBody(),
      ),
    );
  }

  addItem(String value) {
    tarefa.SetNome(value);
    tarefa.SetData(DateTime.now());
    setState(() => lista.add(tarefa));
    controller.clear();
    tarefa = Tarefa();
  }

  vAppBar() {
    return new AppBar(
      title: Center(
        child: Text("Lista de Tarefas"),
      ),
    );
  }

  vBody() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controller,
            onSubmitted: (value) => addItem(value),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return vItemTarefa(index);
              },
              itemCount: lista.length //lista.length,
              ),
        )
      ],
    );
  }

  vItemTarefa(int index) {
    return Row(
      children: [_vIconButton(index), _vTitleDate(index)],
    );
  }

  _EstadoCheck(int index) {
    return lista[index].GetConcluido()
        ? Icons.check_box
        : Icons.check_box_outline_blank;
  }

  _vIconButton(int index) {
    return IconButton(
      onPressed: () {
        setState(() => lista[index].SetConcluido(true));
      },
      icon: Icon(
        _EstadoCheck(index),
        color: Colors.green,
      ),
      iconSize: 34.0,
    );
  }

  _vTitleDate(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lista[index].GetNome(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(lista[index].GetDataStr()),
      ],
    );
  }
}
