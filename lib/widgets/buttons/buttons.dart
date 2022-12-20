import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Widget textView;
  final VoidCallback onPressed;
  final Color? color;

  BaseButton({required this.textView, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: textView,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.elevatedbuttongold),
        primary: Theme.of(context).colorScheme.basebuttonColor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class ErrorButton extends StatelessWidget {
  final Widget textView;
  final VoidCallback onPressed;
  final Color? color;

  ErrorButton({required this.textView, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: textView,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.elevatedbuttongold),
        primary: Theme.of(context).colorScheme.errorbuttoncolor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
