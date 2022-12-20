import 'dart:async';
import 'dart:convert';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/resources/strings/strings.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_O3.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_PM10.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/text_styles.dart';

import '../model/aircindition_SO2.dart';

class GetSO2Value extends StatefulWidget {
  const GetSO2Value({super.key});

  @override
  State<GetSO2Value> createState() => _GetSO2Value();
}

class _GetSO2Value extends State<GetSO2Value> {
  late Future<SO2> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getSO2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<SO2>(
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
