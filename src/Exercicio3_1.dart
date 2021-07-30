import 'Pessoa.dart';

void main () {
  var cadastro = [
    Pessoa(Sexo.F, 16, 'Rapunzel', 2220.2),
    Pessoa(Sexo.F, 25, 'Rosana', 3415.55),
    Pessoa(Sexo.F, 35, 'Marcela', 7888.0),
    Pessoa(Sexo.F, 55, 'Diana', 13551.88),
    Pessoa(Sexo.F, 21, 'Naomi', 4554.18),
    Pessoa(Sexo.M, 19, 'Taciano', 1554.4),
    Pessoa(Sexo.M, 48, 'Romildo', 8722.0),
    Pessoa(Sexo.M, 44, 'Jorge', 15588.4),
    Pessoa(Sexo.M, 27, 'Clauss', 2441.8),
    Pessoa(Sexo.M, 59, 'Magaiver', 7778.4),
  ];

  print('Cadastro:');
  cadastro.forEach((element) => print(element));

  print('');
  print('Existe mulher? ' + cadastro.any((element) => element.sexo == Sexo.F).toString());
  print('Existe homem? ' + cadastro.any((element) => element.sexo == Sexo.M).toString());
  print('Existe apenas mulheres? ' + cadastro.every((element) => element.sexo == Sexo.F).toString());
  print('Existe apenas homens? ' + cadastro.every((element) => element.sexo == Sexo.M).toString());

  print('');

  var listaF = cadastro.where((element) => element.sexo == Sexo.F).toList();
  var idadeMediaF = listaF.map((e) => e.idade).fold(0, (int previousValue, element) => previousValue + element) / listaF.length;
  print('Idade média de mulheres: $idadeMediaF');

  var listaM = cadastro.where((element) => element.sexo == Sexo.M).toList();
  var idadeMediaM = listaM.map((e) => e.idade).fold(0, (int previousValue, element) => previousValue + element) / listaM.length;
  print('Idade média de homens: $idadeMediaM');

  print('');
  cadastro.sort((a, b) => a.salario.compareTo(b.salario));
  var pessoaMaiorSalario = cadastro.last;
  print('A pessoa com maior salário é do sexo ${pessoaMaiorSalario.sexo.toString().split('.').last},'
      ' com salário de R\$ ${pessoaMaiorSalario.salario.toStringAsFixed(2)}');

  var mediaSalF = listaF.map((e) => e.salario).fold(0.0, (double previousValue, element) => previousValue + element) / listaF.length;
  cadastro.removeWhere((element) => element.sexo == Sexo.F && element.salario < mediaSalF);

  var mediaSalM = listaF.map((e) => e.salario).fold(0.0, (double previousValue, element) => previousValue + element) / listaM.length;
  cadastro.removeWhere((element) => element.sexo == Sexo.M && element.salario > mediaSalM);

  print('');
  print('Cadastro:');
  cadastro.forEach((element) => print(element));
}