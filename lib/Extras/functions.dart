import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';

class Functions {
  static showSnackBar(BuildContext context, String message, {Color? color}) {
    color ??= CColors.buttonOne;
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
