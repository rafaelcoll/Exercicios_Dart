import 'dart:convert';

class User {
  late int _id;
  late String _name;
  late String _username;
  late String _email;
  late Address? _address;
  late String _phone;
  late String _website;
  late Company? _company;

  User(this._id, this._name, this._username, this._email, this._address,
      this._phone, this._website, this._company);

  User.fromJson(String source) {
    var jsonAuxMap = json.decode(source);
    this._id = jsonAuxMap['id'];
    this._name = jsonAuxMap['name'];
    this._username = jsonAuxMap['username'];
    this._email = jsonAuxMap['email'];
    this._address = Address.fromJson(json.encode(jsonAuxMap['address']));
    this._phone = jsonAuxMap['phone'];
    this._website = jsonAuxMap['website'];
    this._company = Company.fromJson(json.encode(jsonAuxMap['company']));
  }

  String? getValue(String? field){
    if (field == null) {
      return null;
    }
    switch(field){
      case 'id': return _id.toString();
      case 'name': return _name;
      case 'username':return _username;
      case 'email':return _email;
      case 'address':return _address.toString();
      case 'phone':return _phone;
      case 'website':return _website;
      case 'company':return _company.toString();
      default: return throw Exception('Campo inexistente.');
    }
  }

  @override
  String toString() {
    return 'User{id: $_id, name: $_name, username: $_username, email: $_email, address: $_address, phone: $_phone, website: $_website, company: $_company}';
  }
}

class Address {
  late String _street;
  late String _suite;
  late String _city;
  late String _zipcode;
  late Geo _geo;

  Address(this._street, this._suite, this._city, this._zipcode, this._geo);

  Address.fromJson(String source) {
    var jsonAuxMap = json.decode(source);
    this._street = jsonAuxMap['street'];
    this._suite = jsonAuxMap['suite'];
    this._city = jsonAuxMap['city'];
    this._zipcode = jsonAuxMap['zipcode'];
    this._geo = Geo.fromJson(json.encode(jsonAuxMap['geo']));
  }

  @override
  String toString() {
    return 'Address{street: $_street, suite: $_suite, city: $_city, zipcode: $_zipcode, geo: $_geo}';
  }
}

class Geo {
  late double _lat;
  late double _lng;

  Geo(this._lat, this._lng);

  Geo.fromJson(String source) {
    var jsonAuxMap = json.decode(source);
    this._lat = double.parse(jsonAuxMap['lat']);
    this._lng = double.parse(jsonAuxMap['lng']);
  }

  @override
  String toString() {
    return 'Geo{lat: $_lat, lng: $_lng}';
  }
}

class Company {
  late String _name;
  late String _catchPhrase;
  late String _bs;

  Company(this._name, this._catchPhrase, this._bs);

  Company.fromJson(String source) {
    var jsonAuxMap = json.decode(source);
    this._name = jsonAuxMap['name'];
    this._catchPhrase = jsonAuxMap['catchPhrase'];
    this._bs = jsonAuxMap['bs'];
  }

  @override
  String toString() {
    return 'Company{name: $_name, catchPhrase: $_catchPhrase, bs: $_bs}';
  }
}