import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<CO> CityFuture = getCO();

final controller = TextEditingController();
Future<CO> getCO() async {
  const url = "https://api.gios.gov.pl/pjp-api/rest/data/getData/5246";
  final response = await http.get(Uri.parse(url));
//print(jsonDecode(response.body)['features'][0]['properties']['pm2.5']['A1h']);
  final body = json.decode(response.body);
  print(jsonDecode(response.body)['values'][0]);
  return CO.fromJson(jsonDecode(response.body)['values'][0]);
}

class CO {
  final String? date;
  final double value;

  const CO({
    required this.date,
    required this.value,
  });

  static CO fromJson(json) => CO(
      date: json['date'] != null ? json['date'] : '0',
      value: json['value'] != null ? json['value'] : 0);
}
