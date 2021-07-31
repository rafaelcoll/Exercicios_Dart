import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import '../src/Usuario.dart';

void main(){
  var url;
  var response;
  var usersList;

  group('Teste de fluxo', (){
    setUp(() async {
      url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
      response = await http.get(url);
    });

    test('Conexão com o servidor OK', () {
      expect(response.statusCode, equals(200));
    });

    test('Criação de objeto a partir de dado do site', () {
      User user = User.fromJson(response.body);
      expect(user.getValue('name'), equals('Leanne Graham'));
    });
  });

  group('Teste de objeto User', () {
    var string = '''{
      "id": 2,
      "name": "Ervin Howell",
      "username": "Antonette",
      "email": "Shanna@melissa.tv",
      "address": {
        "street": "Victor Plains",
        "suite": "Suite 879",
        "city": "Wisokyburgh",
        "zipcode": "90566-7771",
        "geo": {
          "lat": "-43.9509",
          "lng": "-34.4618"
        }
      },
      "phone": "010-692-6593 x09125",
      "website": "anastasia.net",
      "company": {
        "name": "Deckow-Crist",
        "catchPhrase": "Proactive didactic contingency",
        "bs": "synergize scalable supply-chains"
      }
    }''';

    test('Teste de criação do objeto', () {
      User user = User.fromJson(string);
      expect(user.getValue('email'), equals('Shanna@melissa.tv'));
    });

    test('.getValue com parametro nulo', () {
      User user = User.fromJson(string);
      expect(user.getValue(null), isNull);
    });

    test('.getValue com paramentro inexistente', () {
      User user = User.fromJson(string);
      expect(() => user.getValue('nome'), throwsException);
    });
  });

  group('Teste de carregamento de lista', () {
    setUp(() async {
      url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      response = await http.get(url);
      usersList = List.of(
          json.decode(response.body).map((element) => (User.fromJson(
              json.encode(element)))));
    });

    test('Teste sobre os objetos da lista', () {
      expect(usersList.every((element) => element.runtimeType == User),
          equals(true));
    });
  });

}