import 'dart:ffi';

class Moeda {
  late  String icone;
  late String nome;
  late String sigla;
  double preco;

  Moeda({
    required this.icone,
    required this.nome,
    required this.sigla,
    required this.preco,
  });
}