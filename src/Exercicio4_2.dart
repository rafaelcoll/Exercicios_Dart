import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Usuarios.dart';

Future<void> main() async{
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);

  var usersList = List.of(json.decode(response.body).map((element) => (User.fromJson(json.encode(element)))));

  usersList.forEach((element) => print(element));
}