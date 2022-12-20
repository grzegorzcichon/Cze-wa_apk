// @dart=2.9

import 'package:flutter/material.dart';

import 'views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "O Częstochowie",
      home: HomePage(),
    );
  }
}
