import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<O3> CityFuture = getO3();

final controller = TextEditingController();
Future<O3> getO3() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/5253";
  final response = await http.get(Uri.parse(url));
//print(jsonDecode(response.body)['features'][0]['properties']['pm2.5']['A1h']);
  final body = json.decode(response.body);
  print(jsonDecode(response.body)['values'][0]);
  return O3.fromJson(jsonDecode(response.body)['values'][0]);
}

class O3 {
  final String? date;
  final double value;

  const O3({
    required this.date,
    required this.value,
  });

  static O3 fromJson(json) => O3(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
