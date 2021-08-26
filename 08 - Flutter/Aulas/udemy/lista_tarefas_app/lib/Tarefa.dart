class Tarefa {
  // Atributos:
  String _nome = '';
  DateTime _data = DateTime.now();
  bool _concluido = false;

  // Construtor:
  /*
  Tarefa(String nome) {
    this._nome = nome;
  }
  */

  // Getters e Setters:
  GetNome() {
    return _nome;
  }

  GetDataStr() {
    return _data.toString();
  }

  GetConcluido() {
    return _concluido;
  }

  SetNome(String value) {
    this._nome = value;
    return this;
  }

  SetData(DateTime value) {
    this._data = value;
    return this;
  }

  SetConcluido(bool value) {
    this._concluido = value;
    return this;
  }
}
