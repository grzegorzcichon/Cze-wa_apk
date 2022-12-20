import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<SO2> CityFuture = getSO2();

final controller = TextEditingController();
Future<SO2> getSO2() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/5260";
  final response = await http.get(Uri.parse(url));
//print(jsonDecode(response.body)['features'][0]['properties']['pm2.5']['A1h']);
  final body = json.decode(response.body);
  print(jsonDecode(response.body)['values'][0]);
  return SO2.fromJson(jsonDecode(response.body)['values'][0]);
}

class SO2 {
  final String? date;
  final double value;

  const SO2({
    required this.date,
    required this.value,
  });

  static SO2 fromJson(json) => SO2(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
