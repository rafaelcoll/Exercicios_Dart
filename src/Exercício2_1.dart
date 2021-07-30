import 'Veiculos.dart';

void main(List<String> arguments) {
  var carrinho = Carro (55, odometro: 1000, rendimento: 10);
  print('Teste criação novo carro');
  print(carrinho);

  carrinho.deslocar(120);
  print('Teste desclocar 120km:');
  print(carrinho);

  carrinho.deslocar(-55);
  print('Teste desclocar -55km:');
  print(carrinho);

  carrinho.abastecer(-2);
  print('Teste abastecer -2 litros:');
  print(carrinho);

  carrinho.abastecer(15);
  print('Teste abastecer 15 litros:');
  print(carrinho);

  carrinho.rendimento = 50;
  print('Teste rendimento 50 km/litro:');
  print(carrinho);

  carrinho.rendimento = 12;
  print('Teste rendimento 12 km/litro:');
  print(carrinho);

  carrinho.deslocar(1000);
  print('Teste deslocar 1000km:');
  print(carrinho);

  carrinho.abastecer(60);
  print('Teste abastecer 60 litros:');
  print(carrinho);

  print('Teste metodo estadoDoTanque():');
  print(carrinho.estadoDoTanque());

}
