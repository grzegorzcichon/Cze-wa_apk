import 'package:cached_network_image/cached_network_image.dart';
import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/views/districts/model/districts.dart';
import 'package:czestochowa_app/widgets/appbars/appbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../resources/strings/strings.dart';
import '../../../widgets/text_styles.dart';

class DistrictsPage extends StatelessWidget {
  final Districts item;

  const DistrictsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppbarDistrictsScreen(),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.05,
            height: (MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Image(
                    image: CachedNetworkImageProvider(item.urlAvatar),
                    height: (MediaQuery.of(context).size.height / 2.5),
                    width: (MediaQuery.of(context).size.width - 32.0),
                    fit: BoxFit.fill),
                const SizedBox(height: 6),

                //Image.network(item.urlAvatar,
                // height: (MediaQuery.of(context).size.height / 2.5),
                //width: double.infinity,

                // width: (MediaQuery.of(context).size.width - 32.0),
                //fit: BoxFit.fill),
                //const SizedBox(height: 6),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    Str.label.districtname,
                                    style: TextStyleSS.overline(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .fontdistrictnametext,
                                        context: context),
                                  ),
                                ),
                                Text(
                                  item.name,
                                  style: TextStyleSS.overline(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontdistrictnametext,
                                      context: context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                Str.label.districtpopulation,
                                style: TextStyleSS.overline(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .fontdistrictnametext,
                                    context: context),
                              ),
                            ),
                            Text(
                              item.population,
                              style: TextStyleSS.overline(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontdistrictnametext,
                                  context: context),
                            ),
                          ],
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          // height: (MediaQuery.of(context).size.height * 3),
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            item.description,
                            style: TextStyleSS.overline(
                                color: Theme.of(context)
                                    .colorScheme
                                    .fontdistrictnametext,
                                context: context),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      );
}
