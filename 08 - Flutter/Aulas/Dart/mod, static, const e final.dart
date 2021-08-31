class Valores {
  static int clicado = 0;
}

class Pessoa {}

void main() {
  Valores.clicado = 3;
  print("Static -> ${Valores.clicado}");

  const numero = 3;
  print("Constante -> $numero");

  final Pessoa p = Pessoa();
  print(p.toString());
}
