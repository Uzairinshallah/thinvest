import 'package:hive/hive.dart';
import 'package:thinvest/Extras/constants.dart';
import 'package:thinvest/models/user_model.dart';

class HiveBoxes {
  static var userBox = Hive.box<UserModel>(Constants.userBox);
}
