import 'dart:async';
import 'dart:convert';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../resources/strings/strings.dart';
import '../../../widgets/text_styles.dart';
import '../model/aircindition_CO.dart';

class GetCOValue extends StatefulWidget {
  const GetCOValue({super.key});

  @override
  State<GetCOValue> createState() => _GetCOValueState();
}

class _GetCOValueState extends State<GetCOValue> {
  late Future<CO> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getCO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<CO>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Wrap(
                          children: [
                            Text(
                              '${Str.label.covalue}${double.parse(snapshot.data!.value.toString()).toStringAsFixed(2)}${Str.label.airconditionunit}',
                              style: TextStyleSS.overline(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontdistrictnametext,
                                  context: context),
                            )
                          ],
                        ),
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
