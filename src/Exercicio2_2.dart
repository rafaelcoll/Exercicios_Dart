import 'Supermercado.dart';

void main() {
  var supermercado = Supermercado(2);
  print (supermercado);

  var lista = List.generate(20, (index) => Cliente());
  print(lista);

  var caixa = CaixaDeSupermercado();

  lista.forEach((element) => supermercado.entraCliente(element));
  print (supermercado);
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  print (supermercado.atendeCliente(1));
  supermercado.alteraStatusCaixa(1, false);
  supermercado.entraCliente(Cliente());
  supermercado.entraCliente(Cliente());
  supermercado.entraCliente(Cliente());
  supermercado.entraCliente(Cliente());
  supermercado.entraCliente(Cliente());
  supermercado.entraCliente(Cliente());
  print (supermercado);

}