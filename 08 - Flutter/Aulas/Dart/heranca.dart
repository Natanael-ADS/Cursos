/*--------------------------------------------------------*/
abstract class Animal {
  String nome = "";

  Animal(this.nome);

  comer();

  dorme() => print("$nome está dormindo.");

  fazerSom() => print("$nome está fazendo algum som!");
}

/*--------------------------------------------------------*/
class Cachorro extends Animal {
  Cachorro(String nome) : super(nome);

  bagunca() => print("$nome está fazendo bagunca!");

  @override
  fazerSom() => print("$nome fez au au auu!");

  @override
  String toString() => "O nome do cachorro é $nome";

  @override
  comer() => print("$nome está comendo!");
}

/*--------------------------------------------------------*/
class Gato extends Animal {
  Gato(String nome) : super(nome);

  silencioso() => print("$nome está muito queto!");

  @override
  fazerSom() => print("$nome fez miaaaauuu!");

  @override
  String toString() => "O nome do gato é $nome";

  @override
  comer() => print("$nome está comendo!");
}

/*--------------------------------------------------------*/
void main() {
  Cachorro dog = Cachorro("TheRock");
  dog.comer();
  dog.bagunca();
  dog.dorme();
  dog.fazerSom();
  print(dog);

  print("--------------------------");
  Gato cat = Gato("TheTiger");
  cat.comer();
  cat.dorme();
  cat.silencioso();
  cat.fazerSom();

  print(cat);
}
