import 'dart:async';
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                (HiveBoxes.userBox.isEmpty) ? LoginPage() : Dashboard())));

    var assetsImage = const AssetImage('assets/icons/thinvest.png');
    var image = Image(image: assetsImage, height: 80);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: image,
        ),
      ), //<- place where the image appears
    );
  }
}
