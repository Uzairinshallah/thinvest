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

  static showLoaderDialog(BuildContext context, {String text = 'Loading'}) {
    var mediaQuery = MediaQuery.of(context);
    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator()
            // Image(
            //   image: const AssetImage("assets/images/loading.gif"),
            //   width: 200,
            // ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
