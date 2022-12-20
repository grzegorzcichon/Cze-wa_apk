import 'dart:convert';
import 'dart:io';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/widgets/appbars/appbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../resources/strings/strings.dart';
import '../../../widgets/text_styles.dart';
import '../districts_build.dart';
import 'bloc/districts_mainpage_bloc.dart';

class DistrictsMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext ct) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DistrictsMainpageBloc(),
        child: DistrictsPageMain(),
      ),
    );
  }
}

class DistrictsPageMain extends StatefulWidget {
  @override
  State<DistrictsPageMain> createState() => _DistrictsPageMainState();
}

class _DistrictsPageMainState extends State<DistrictsPageMain> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppbarDistrictsScreen(),
          body: ListView(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,

            children: <Widget>[
              if (isVisible)
                Container(
                    margin: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 9,
                    child: _buildDistrictsPageContainerInfo()),
              Container(
                  //width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.85,
                  child: _buildDistricts()),
            ],
          )),
    );
  }

  Widget _buildRow({Widget? child}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: child,
    );
  }

  Widget _buildDistrictsPageContainerInfo() {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: <Widget>[
          Container(
            //decoration: Border.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          Str.label.disttrictpageinfo,
                          style: TextStyleSS.overline(
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontdistrictnametext,
                              context: context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          Str.label.airconditioninfoclose,
                          style: TextStyleSS.overline(
                            color: Theme.of(context)
                                .colorScheme
                                .fontdistrictnametext,
                            context: context,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => setState(() => isVisible = !isVisible),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDistricts({Widget? child}) {
    return _buildRow(
        child: Container(
            child: MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(builder: (context) {
            return Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.25,
                margin: EdgeInsets.only(bottom: 1.78),
                child: Districtsbuild());
          }),
        ],
      ),
    )));
  }
}
