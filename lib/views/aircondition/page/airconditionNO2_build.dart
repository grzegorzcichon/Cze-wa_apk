import 'dart:async';
import 'dart:convert';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/resources/strings/strings.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_NO2.dart';
import 'package:czestochowa_app/views/aircondition/model/aircindition_O3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/text_styles.dart';
import '../model/aircindition_CO.dart';

class GetNO2Value extends StatefulWidget {
  const GetNO2Value({super.key});

  @override
  State<GetNO2Value> createState() => _GetNO2Value();
}

class _GetNO2Value extends State<GetNO2Value> {
  late Future<NO2> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getNO2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<NO2>(
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
                              '${Str.label.no2value}${double.parse(snapshot.data!.value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}',
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

            return const CircularProgressIndicator(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
