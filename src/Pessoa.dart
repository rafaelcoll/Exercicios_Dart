enum Sexo {
  M,
  F,
}

class Pessoa {
  Sexo _sexo;
  int _idade;
  final String  _nome;
  double _salario;

  Pessoa(this._sexo, this._idade, this._nome, this._salario);

  double get salario => _salario;

  set salario(double value) {
    _salario = value;
  }

  String get nome => _nome;

  int get idade => _idade;

  set idade(int value) {
    _idade = value;
  }

  Sexo get sexo => _sexo;

  set sexo(Sexo value) {
    _sexo = value;
  }

  @override
  String toString() {
    return 'Pessoa {Sexo: $_sexo, Idade: $_idade, Nome: $_nome, Salario: R\$ ${_salario.toStringAsFixed(2)}}';
  }
}