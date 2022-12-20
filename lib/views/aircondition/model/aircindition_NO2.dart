import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<NO2> CityFuture = getNO2();

final controller = TextEditingController();
Future<NO2> getNO2() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/5250";
  final response = await http.get(Uri.parse(url));
//print(jsonDecode(response.body)['features'][0]['properties']['pm2.5']['A1h']);
  final body = json.decode(response.body);
  print(jsonDecode(response.body)['values'][0]);
  return NO2.fromJson(jsonDecode(response.body)['values'][0]);
}

class NO2 {
  final String? date;
  final double value;

  const NO2({
    required this.date,
    required this.value,
  });

  static NO2 fromJson(json) => NO2(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
