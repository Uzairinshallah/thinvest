import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:http/http.dart' as http;
import 'package:thinvest/models/trades_model.dart';

class TradesTable extends StatelessWidget {
  TradesTable({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getData('a'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return  Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return ListView.builder(
                physics: ScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:
                              getSubHeading(AppStrings.buy, .17, CColors.green),
                        )),
                        Expanded(
                            child: getSubHeading(
                                snapshot.data[index].id.toString(),
                                .17,
                                Colors.black)),
                        Expanded(
                            child: Column(
                          children: [
                            getSubHeading('+47.2025', .17, CColors.green),
                            getSubHeading('+47.2025', .17, Colors.black),
                          ],
                        )),
                        Expanded(
                            child:
                                getSubHeading('30-11-2021', .17, Colors.black)),
                        Expanded(
                            child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CColors.buttonOne),
                              child: Center(
                                child: Text(
                                  AppStrings.view,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  );
                });
          }
          return const Text("Error while calling getData");
        });
  }

  Widget getSubHeading(String txt, double size, Color col) {
    return SizedBox(
      width: screenWidth * size,
      child: Text(txt,
          style: TextStyle(color: col, fontSize: 12),
          textAlign: TextAlign.left),
    );
  }

  Future<List<TradesModel>> getData(context) async {
    var url = "https://thinvest.com/api/deposit";
    var response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      List<TradesModel> arrData = [];
      for(var result in results){
        var model = TradesModel.fromMap(result);
        arrData.add(model);
      }



      print(arrData.length);


      return arrData;
    } else {
      print('Something Wrong');
      throw Exception("Failed to Fetch Data");
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:thinvest/Extras/colors.dart';
// import 'package:thinvest/Extras/strings.dart';
// import 'package:http/http.dart' as http;
// import 'package:thinvest/models/deposit_model.dart';
//
// class TradesTable extends StatelessWidget {
//   TradesTable({Key? key}) : super(key: key);
//
//   var screenWidth, screenHeight;
//
//
//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//     return ListView.builder(
//         physics: ScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: 5,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 4.0),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: getSubHeading(
//                           AppStrings.buy, .17, CColors.green),
//                     )),
//                 Expanded(
//                     child: getSubHeading(
//                         '25000.0', .17, Colors.black)),
//                 Expanded(
//                     child: Column(
//                       children: [
//                         getSubHeading(
//                             '+47.2025', .17, CColors.green),
//                         getSubHeading(
//                             '+47.2025', .17, Colors.black),
//                       ],
//                     )),
//                 Expanded(
//                     child: getSubHeading(
//                         '30-11-2021', .17, Colors.black)),
//                 Expanded(
//                     child: InkWell(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 30,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                               BorderRadius.circular(10),
//                               color: CColors.buttonOne),
//                           child: Center(
//                             child: Text(
//                               AppStrings.view,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           );
//         });
//   }
//
//   Widget getSubHeading(String txt, double size, Color col) {
//     return SizedBox(
//       width: screenWidth * size,
//       child: Text(txt,
//           style: TextStyle(color: col, fontSize: 12),
//           textAlign: TextAlign.left),
//     );
//   }
//
//
//   Future<List<DepositModel>> getData(context) async {
//     var url = "https://reqres.in/api/users?page=2";
//     var response = await http.get(Uri.parse(url));
//     print(response);
//     if (response.statusCode == 200) {
//       //print('Data found');
//       ModelClassFetch dataModel = modelClassFromMap(response.body);
//       //print(dataModel.support.url);
//       List<DepositModel> arrData = dataModel.data;
//       return arrData;
//     }else{
//       print('Something Wrong');
//       throw Exception("Failed to Fetch Data");
//     }
//
//   }
// }
