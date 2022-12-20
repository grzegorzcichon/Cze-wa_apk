import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Text("Hello"))),
    );
  }
}
 //Widget _buildInfoteka() {
    //return _buildRow(
       // child: Container(
         //   child: MergeSemantics(
     // child: Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
       /// children: <Widget>[
         // ContainerSS(
         //     width: (MediaQuery.of(context).size.width),
          //    height: 60,
          //    margin: EdgeInsetsSS.only(bottom: 1.78),
           //   child: InfotekA()),
      //  ],
      //),
   // )));
  //}