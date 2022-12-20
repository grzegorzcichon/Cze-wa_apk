import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<C6H6> CityFuture = getC6H6();

final controller = TextEditingController();
Future<C6H6> getC6H6() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/14913";
  final response = await http.get(Uri.parse(url));
//print(jsonDecode(response.body)['features'][0]['properties']['pm2.5']['A1h']);
  final body = json.decode(response.body);
  print(jsonDecode(response.body)['values'][0]);
  return C6H6.fromJson(jsonDecode(response.body)['values'][0]);
}

class C6H6 {
  final String? date;
  final double value;

  const C6H6({
    required this.date,
    required this.value,
  });

  static C6H6 fromJson(json) => C6H6(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
