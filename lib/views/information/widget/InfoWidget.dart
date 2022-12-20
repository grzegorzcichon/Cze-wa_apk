import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_styles.dart';

class InfoWidget extends StatelessWidget {
  final Map<String, dynamic> map;

  const InfoWidget({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => map.isEmpty
      ? Center(child: CircularProgressIndicator())
      : ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          children: map.keys.map((key) {
            final value = map[key];

            return Container(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(key,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text('$value',
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.overline(
                            color: Theme.of(context).colorScheme.fontblacktext,
                            context: context)),
                  ),
                ],
              ),
            );
          }).toList(),
        );
}
