import 'dart:async';
import 'dart:convert';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/resources/strings/strings.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_C6H6.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_O3.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_PM10.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/text_styles.dart';

import '../model/aircindition_SO2.dart';

class GetC6H6Value extends StatefulWidget {
  const GetC6H6Value({super.key});

  @override
  State<GetC6H6Value> createState() => _GetC6H6Value();
}

class _GetC6H6Value extends State<GetC6H6Value> {
  late Future<C6H6> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getC6H6();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<C6H6>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${Str.label.so2value}${double.parse(snapshot.data!.value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}',
                              style: TextStyleSS.overline(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontdistrictnametext,
                                  context: context),
                            ),
                          )
                        ],
                      ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
