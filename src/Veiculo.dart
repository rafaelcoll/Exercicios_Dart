abstract class Veiculo {
  late double _odometro;
  late double _rendimento;
  late double _tanqueDeCombustivel;
  late final double _capacidadeTanqueDeCombustivel;

  double get capacidadeTanqueDeCombustivel => _capacidadeTanqueDeCombustivel;

  double get rendimento => _rendimento;

  set rendimento(double value) {
    if (value > 0) {
      _rendimento = value;
    }
  }

  double get tanqueDeCombustivel => _tanqueDeCombustivel;

  double get odometro => _odometro;

  void abastecer(double value) {
    if (value > 0) {
      if (_tanqueDeCombustivel + value > _capacidadeTanqueDeCombustivel) {
        _tanqueDeCombustivel = _capacidadeTanqueDeCombustivel;
      } else {
        _tanqueDeCombustivel += value;
      }
    }
  }

  void deslocar(double value) {
    if (value > 0) {
      var maxDesclocamento = _tanqueDeCombustivel * _rendimento;
      if (value > maxDesclocamento) {
        _odometro += maxDesclocamento;
        _tanqueDeCombustivel = 0;
      } else {
        _odometro += value;
        _tanqueDeCombustivel -= (value / rendimento);
      }
    }
  }

  String estadoDoTanque() {
    return _tanqueDeCombustivel.toStringAsFixed(1) +
        'L / ' +
        _capacidadeTanqueDeCombustivel.toStringAsFixed(1) +
        'L (' +
        (_tanqueDeCombustivel / _capacidadeTanqueDeCombustivel * 100).toStringAsFixed(1) +
        '%)';
  }

}

class Carro extends Veiculo {

  Carro(double capacidadeTanqueDeCombustivel,
      {double odometro = 0, double rendimento = 15}) {
  _capacidadeTanqueDeCombustivel = capacidadeTanqueDeCombustivel;
  _tanqueDeCombustivel = _capacidadeTanqueDeCombustivel;
    if (rendimento <= 0 || rendimento > 15) {
      _rendimento = 15;
    } else {
      _rendimento = rendimento;
    }
    if (odometro < 0) {
      _odometro = 0;
    } else {
      _odometro = odometro;
    }
  }

  set rendimento(double value) {
    if (value > 15) {
      super._rendimento = 15;
    } else {
      super._rendimento = value;
    }
  }

  @override
  String toString() {
    return 'Carro {Odometro: ${_odometro.toStringAsFixed(1)},'
        ' Rendimento: ${_rendimento.toStringAsFixed(1)},'
        ' TanqueDeCombustivel: ${_tanqueDeCombustivel.toStringAsFixed(1)},'
        ' CapacidadeTanqueDeCombustivel: ${_capacidadeTanqueDeCombustivel.toStringAsFixed(1)}}';
  }
}