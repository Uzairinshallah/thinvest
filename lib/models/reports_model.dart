import 'package:thinvest/models/reports_model.dart';

class ReportsModel {
  String? long = '123';
  String? short = '123';
  String? returnn = '123';
  String? monthlyReturn = '123';
  String? yearlyReturn = '123';


  ReportsModel({
    required this.long,
    required this.short,
    required this.returnn,
    required this.monthlyReturn,
    required this.yearlyReturn,

  });

  Map<String, dynamic> toMap() {
    return {
      'long': long,
      'short': short,
      'returnn': returnn,
      'monthlyReturn': monthlyReturn,
      'yearlyReturn': yearlyReturn,
    };
  }

  ReportsModel.fromMap(Map<String, dynamic> map) {
    long = map["long"];
    short = map["short"];
    returnn = map["returnn"];
    monthlyReturn = map["monthlyReturn"];
    yearlyReturn = map["yearlyReturn"];
  }
}
