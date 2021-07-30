import 'dart:math';

class Supermercado {
  double _totalFaturamento = 0;
  double _perdaDeFaturamento = 0;
  int _totalClientes = 0;
  int _qtdClientesNaoAtendidos = 0;
  double _menorValorCompra = 0;
  double _maiorValorCompra = 0;
  late List<CaixaDeSupermercado> _caixas;

  Supermercado(int numeroDeCaixas) {
    if (numeroDeCaixas <= 0) {
      throw Exception('Quantidade de Caixas deve ser positivo.');
    }
    _caixas = List.generate(numeroDeCaixas, (index) => CaixaDeSupermercado());
  }

  void entraCliente(Cliente cliente) {
    _totalClientes++;
    var caixasDisponiveis = _caixas.where((element) => element.caixaDisponivel).toList();
    if (caixasDisponiveis.isNotEmpty) {
      caixasDisponiveis.sort((caixa1, caixa2) => caixa1._fila.length.compareTo(caixa2._fila.length));
      caixasDisponiveis.first.entraCliente(cliente);
    } else {
      _qtdClientesNaoAtendidos++;
      _perdaDeFaturamento += cliente.valorDeCompra;
    }
  }

  void validaCaixa(int numeroDoCaixa) {
    if (numeroDoCaixa <= 0 || numeroDoCaixa > _caixas.length) {
      throw Exception('Caixa inválido.');
    }
  }

  void alteraStatusCaixa(int numeroDoCaixa, bool status) {
    validaCaixa(numeroDoCaixa);
    _caixas[numeroDoCaixa - 1].caixaAberto = status;
  }

  bool atendeCliente(int numeroDoCaixa) {
    validaCaixa(numeroDoCaixa);
    var cliente = _caixas[numeroDoCaixa - 1].avancaFila();
    if (cliente == null) {
      return false;
    }
    var valorDaCompra = cliente.valorDeCompra;
    _totalFaturamento += valorDaCompra;

    if (_menorValorCompra == 0) {
      _menorValorCompra = valorDaCompra;
    } else if (valorDaCompra < _menorValorCompra) {
      _menorValorCompra = valorDaCompra;
    }

    if (_maiorValorCompra == 0) {
      _maiorValorCompra = valorDaCompra;
    } else if (valorDaCompra > _maiorValorCompra) {
      _maiorValorCompra = valorDaCompra;
    }

    return true;
  }

  @override
  String toString() {
    var caixasString = '';
    for (var i = 0; i < _caixas.length; i++) {
      caixasString += 'Caixa #${i + 1}\n${_caixas[i]}\n';
    }
    return 'Supermercado\n'
        'TotalFaturamento: R\$ ${_totalFaturamento.toStringAsFixed(2)}\n'
        'PerdaDeFaturamento: R\$ ${_perdaDeFaturamento.toStringAsFixed(2)}\n'
        'TotalClientes: $_totalClientes\n'
        'QtdClientesNaoAtendidos: $_qtdClientesNaoAtendidos\n'
        'MenorValorCompra: R\$ ${_menorValorCompra.toStringAsFixed(2)}\n'
        'MaiorValorCompra: R\$ ${_maiorValorCompra.toStringAsFixed(2)}\n'
        'Total de Caixas disponíveis: ${_caixas.length}\n'
        'Caixas em funcionamento: ${_caixas.where((element) => element.caixaDisponivel).length}\n'
        'Caixas parados: ${_caixas.where((element) => !element.caixaDisponivel).length}\n'

        'Caixas:\n'
        // '${_caixas.join('\n')}}\n'
        '$caixasString';

  }
}

class CaixaDeSupermercado {
  late bool _caixaAberto;
  late List<Cliente?> _fila;
  int capacidade;

  CaixaDeSupermercado({this.capacidade = 10, aberto = true}) {
    _caixaAberto = aberto;
    _fila = List.empty(growable: true);
  }

  List<Cliente?> get fila => _fila;

  bool get caixaAberto => _caixaAberto;

  set caixaAberto(bool value) {
    _caixaAberto = value;
  }

  Cliente? avancaFila() {
    if (_fila.isNotEmpty) {
      if (Random().nextInt(100) >= 50) {
        return _fila.removeAt(0);
      }
    }
    return null;
  }

  bool entraCliente(Cliente cliente) {
    if (caixaDisponivel) {
      _fila.add(cliente);
      return true;
    } else {
      return false;
    }
  }

  bool get caixaDisponivel => (_caixaAberto && _fila.length < capacidade);

  @override
  String toString() {
    return //'CaixaDeSupermercado=\n'
        '\tCaixaDisponivel: $caixaDisponivel\n'
        '\tCaixaAberto: $_caixaAberto\n'
        '\tCapacidade da fila: $capacidade\n'
        '\tFila: $_fila';
  }
}

class Cliente {
  late final double _valorDeCompra;

  Cliente() {
    _valorDeCompra = 10 + (Random().nextInt(500001 - 1000) / 100);
  }

  double get valorDeCompra => _valorDeCompra;

  @override
  String toString() {
    return 'Cliente{ValorDeCompra: R\$ ${_valorDeCompra.toStringAsFixed(2)}}';
  }
}

