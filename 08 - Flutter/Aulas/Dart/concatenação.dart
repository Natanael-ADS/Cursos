import 'objeto-pessoa.dart';

void main() {
  Pessoa pessoa = Pessoa();

  pessoa.SetNome("Natanael").SetIdade(27).SetCasado(false);

  print("Seu nome é " + pessoa.GetNome());
  print("Sua idade é ${pessoa.GetIdade()}");

  String ehCasado = pessoa.GetCasado() ? "SIM" : "NÃO";
  print("Você é casado $ehCasado");
}
