import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/constants.dart';
import 'package:thinvest/models/user_model.dart';
import 'package:thinvest/screens/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document;
  if (!kIsWeb) {
    document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
  }

  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(Constants.userBox);

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(
    const MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: CColors.buttonOne),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
