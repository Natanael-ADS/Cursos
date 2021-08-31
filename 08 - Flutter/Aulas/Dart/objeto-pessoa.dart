class Pessoa {
  /*---------------------------------ATRIBUTOS--------------------------------*/
  String _nome = "";
  int _idade = 0;
  bool _casado = false;

  /*--------------------------------CONSTRUTORES------------------------------*/
  Pessoa();
  Pessoa.criar(this._nome, this._idade, this._casado);
  Pessoa.casado(this._nome, this._idade) {
    this._casado = true;
    print("Pessoa Casada");
  }

  /*-------------------------------GETTERS/SETTERS----------------------------*/
  String get nome => _nome;
  int get idade => _idade;
  bool get casado => _casado;

  set nome(String value) => _nome = value;
  set idade(int value) => _idade = value;
  set casado(bool value) => _casado = value;

  /*-----------------------------------FUNÇÕES--------------------------------*/
  String GetNome() => _nome;
  int GetIdade() => _idade;
  bool GetCasado() => _casado;

  Pessoa SetNome(String value) {
    this._nome = value;
    return this;
  }

  Pessoa SetIdade(int value) {
    this._idade = value;
    return this;
  }

  Pessoa SetCasado(bool value) {
    this._casado = value;
    return this;
  }

  String toString() => "Nome: $_nome \nIdade: $_idade \nCasado: $_casado";
}

void main() {
  Pessoa pessoa = Pessoa();
  pessoa.nome = "Natanael";
  pessoa.idade = 25;
  pessoa.casado = true;

  print(pessoa.toString());

  var pessoaMsg =
      pessoa.SetNome("Thais").SetIdade(22).SetCasado(true).toString();
  print(pessoaMsg);

  Pessoa pessoa2 = Pessoa.criar("Thiago", 22, false);
  print(pessoa2.toString());

  Pessoa pessoa3 = Pessoa.casado("Matheus", 25);
  print(pessoa3.toString());
}
