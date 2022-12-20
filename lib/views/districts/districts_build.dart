import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/districts/model/districts.dart';
import 'package:czestochowa_app/views/districts/page/districts_page.dart';
import 'package:czestochowa_app/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../resources/strings/strings.dart';
import '../../widgets/buttons/buttons.dart';
import '../home_page/home_page.dart';
import 'main/districts_mainpage.dart';

class Districtsbuild extends StatefulWidget {
  @override
  State<Districtsbuild> createState() => _DistrictsbuildState();
}

Widget _buildRow(
    {required double height,
    required double minHeight,
    required int index,
    required int index2}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: _buildRow(
        height: height, minHeight: minHeight, index: index, index2: index2),
  );
}

class _DistrictsbuildState extends State<Districtsbuild> {
  Widget build(BuildContext context) => Container(
        child: FutureBuilder<List<Districts>>(
          future: itemFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: const CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text(
                    Str.errors.districtserror,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Center(
                    child: Container(
                        child: ErrorButton(
                      color: Theme.of(context).colorScheme.errorbuttoncolor,
                      textView: Text(Str.buttons.reloaddata,
                          style: TextStyleError.overline(
                              color:
                                  Theme.of(context).colorScheme.fontblacktext,
                              context: context)),
                      onPressed: () {
                        setState(() {
                          {
                            getItem();
                          }
                        });
                      },
                    )),
                  )
                ],
              );
            } else if (snapshot.hasData) {
              final item = snapshot.data!;
              return buildInfo(item);
            } else {
              return Text(
                Str.errors.districtserror,
                style: TextStyles.overline(
                    color: Theme.of(context).colorScheme.fontblacktext,
                    context: context),
              );
            }
          },
        ),
      );

  Widget buildInfo(List<Districts> items) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var minTileHeight = (MediaQuery.of(context).size.width - 32.0);
          final screenHeight = (MediaQuery.of(context).size.height - 124.0);
          final tileHeight = screenHeight / 50;

          if (tileHeight < minTileHeight) {
            minTileHeight = tileHeight;
          }

          if (minTileHeight < 128) {
            minTileHeight = 150;
          }
          final item = items[index];

          return SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                      child: ClipPath(
                    // ignore: sort_child_properties_last
                    child: Row(children: [
                      Column(
                        children: <Widget>[
                          Stack(
                            children: [
                              TextButton(
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 95),
                                  height: minTileHeight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        item.urlAvatar),
                                    fit: BoxFit.fill,
                                  )),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 90),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Wrap(
                                              children: [
                                                Stack(children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Text(
                                                          Str.label
                                                              .districtname,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyleS.overline(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .fontdistrictnametext,
                                                              context:
                                                                  context)),
                                                      Text(item.name,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyleS.overline(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .fontdistrictnametext,
                                                              context:
                                                                  context)),
                                                    ],
                                                  ),
                                                ])
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    height: 25,
                                                    child: Row(
                                                      children: [
                                                        Text(Str.label.districtpopulation,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyleS.overline(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .fontdistrictnametext,
                                                                context:
                                                                    context)),
                                                        Text(item.population,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyleS.overline(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .fontdistrictnametext,
                                                                context:
                                                                    context)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          DistrictsPage(item: item)));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
                ),
              ],
            ),
          );
        },
      );
}
