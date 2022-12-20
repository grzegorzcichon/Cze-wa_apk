import 'dart:async';
import 'dart:convert';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/resources/strings/strings.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_O3.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_PM10.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/text_styles.dart';
import '../model/aircindition_CO.dart';

class GetPM10Value extends StatefulWidget {
  const GetPM10Value({super.key});

  @override
  State<GetPM10Value> createState() => _GetPM10Value();
}

class _GetPM10Value extends State<GetPM10Value> {
  late Future<PM10> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getPM10();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<PM10>(
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
                              '${Str.label.pm10value}${double.parse(snapshot.data!.value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}',
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
