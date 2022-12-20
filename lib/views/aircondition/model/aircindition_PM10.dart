import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PM10> CityFuture = getPM10();

final controller = TextEditingController();
Future<PM10> getPM10() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/5256";
  final response = await http.get(Uri.parse(url));
  final body = json.decode(response.body);
  print('aaa');
  print(jsonDecode(response.body)['values'][1]);
  return PM10.fromJson(jsonDecode(response.body)['values'][1]);
}

class PM10 {
  final String? date;
  final double value;

  const PM10({
    required this.date,
    required this.value,
  });

  static PM10 fromJson(json) => PM10(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
