import 'dart:ui';

import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle overline(
      {required BuildContext context, required Color color}) {
    return GoogleFonts.modernAntiqua(
      textStyle: Theme.of(context)
          .textTheme
          .overline
          ?.copyWith(color: Theme.of(context).colorScheme.fontblacktext),
      fontSize: 18,
    );
  }
}

class TextStyleS {
  static TextStyle overline(
      {required BuildContext context, required Color color}) {
    return GoogleFonts.courgette(
        textStyle: Theme.of(context).textTheme.overline?.copyWith(
            color: Theme.of(context).colorScheme.fontdistrictnametext),
        fontSize: 15,
        fontWeight: FontWeight.bold);
  }
}

class TextStyleSS {
  static TextStyle overline(
      {required BuildContext context, required Color color}) {
    return GoogleFonts.courgette(
        textStyle: Theme.of(context)
            .textTheme
            .overline
            ?.copyWith(color: Theme.of(context).colorScheme.fontblacktext),
        fontSize: 12,
        fontWeight: FontWeight.bold);
  }
}

class TextStyleError {
  static TextStyle overline(
      {required BuildContext context, required Color color}) {
    return GoogleFonts.courgette(
        textStyle: Theme.of(context)
            .textTheme
            .overline
            ?.copyWith(color: Theme.of(context).colorScheme.fontwhitetext),
        fontSize: 15,
        fontWeight: FontWeight.bold);
  }
}
