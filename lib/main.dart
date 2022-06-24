import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thinvest/Extras/constants.dart';
import 'package:thinvest/models/user_model.dart';
import 'package:thinvest/screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document;
  if (!kIsWeb) {
    document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
  }

  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(Constants.userBox);





  runApp(const MyApp());
}
// var box = "userBox";
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
