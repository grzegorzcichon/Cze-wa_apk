import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Districts>> itemFuture = getItem();

final controller = TextEditingController();
Future<List<Districts>> getItem() async {
  const url =
      'https://raw.githubusercontent.com/grzegorzcichon/Czestochowa/main/Dzielnice.json';
  //'https://raw.githubusercontent.com/grzegorzcichon/Czestochowa/main/dzielnicwetest.json';
  final response = await http.get(Uri.parse(url));

  final body = json.decode(response.body);

  return body.map<Districts>(Districts.fromJson).toList();
}

class Districts {
  final String name;
  final String population;
  final String urlAvatar;
  final String description;

  const Districts(
      {required this.name,
      required this.population,
      required this.urlAvatar,
      required this.description});

  static Districts fromJson(json) => Districts(
      name: json['name'],
      population: json['population'],
      urlAvatar: json['urlAvatar'],
      description: json['description']);
}
