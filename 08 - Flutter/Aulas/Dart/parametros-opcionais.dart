void main() {
  returnFamily("Waldenir", son: "Abmael");
}

void returnFamily(String father,
    {String mother = "Geruza", var son, var daughter}) {
  print("Meu pai é $father");
  print("Minha mãe é ${mother}");
  print("Meu filho é $son");
  print("Minha irmã é $daughter");
}

String _Print = ''' 
  Meu pai é Waldenir
  Minha mãe é Geruza
  Meu filho é Abimael
  Minha irmã é null
''';
