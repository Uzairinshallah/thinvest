// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:thinvest/Extras/colors.dart';
// import 'package:thinvest/Extras/hive_boxes.dart';
// import 'package:thinvest/Extras/sdp.dart';
// import 'package:thinvest/Extras/strings.dart';
// import 'package:http/http.dart' as http;
// import 'package:thinvest/models/trades_model.dart';
// import 'package:thinvest/widgets/viewAlert.dart';
//
// class TradesTable extends StatefulWidget {
//   TradesTable({Key? key}) : super(key: key);
//
//   @override
//   State<TradesTable> createState() => _TradesTableState();
// }
//
// class _TradesTableState extends State<TradesTable> {
//   var screenWidth, screenHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     double fontSize = SDP.sdp(10);
//     print(fontSize);
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//     return FutureBuilder(
//         future: getData('a'),
//         builder: (BuildContext context, AsyncSnapshot<List<TradesModel>> snapshot) {
//
//           if (snapshot.connectionState != ConnectionState.done) {
//             return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(CColors.buttonOne),));
//           }
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//
//           if (snapshot.hasData) {
//             var list = snapshot.data!;
//             return ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 padding: EdgeInsets.zero,
//                 itemCount: list.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var model = list[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 4.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: getSubHeading(
//                                   model.type.toString(),
//                                   fontSize,
//                                   CColors.green),
//                             )),
//                         Expanded(
//                             child: getSubHeading(
//                                 model.amount.toString(),
//                                 .17,
//                                 Colors.black)),
//                         Expanded(
//                             child: Column(
//                               children: [
//                                 getSubHeading(
//                                     model.price.toString(),
//                                     fontSize,
//                                     CColors.green),
//                                 getSubHeading(
//                                     model.closing_price.toString(),
//                                     fontSize,
//                                     Colors.black),
//                               ],
//                             )),
//                         Expanded(
//                             child: Column(
//                               children: [
//                                 getSubHeading(
//                                     model.trade_date.toString(),
//                                     fontSize,
//                                     Colors.black),
//                                 getSubHeading(
//                                     model.trade_time.toString(),
//                                     fontSize,
//                                     Colors.black),
//                               ],
//                             )),
//                         Expanded(
//                             child: InkWell(
//                               onTap: (){
//                                 showDialog(context: context, builder: (context) => ViewAlert(tradesModel :model));
//
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: CColors.buttonOne),
//                                   child: Center(
//                                     child: Text(
//                                       AppStrings.view,
//                                       style: const TextStyle(
//                                           color: Colors.white, fontSize: 10),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                   );
//                 });
//           }
//           return const Text("Error while calling getData");
//         });
//   }
//
//   Widget getSubHeading(String txt, double size, Color col) {
//     return SizedBox(
//       width: screenWidth * size,
//       child: Text(txt,
//           style: TextStyle(color: col, fontSize: 12),
//           textAlign: TextAlign.center),
//     );
//   }
//
//   Future<List<TradesModel>> getData(context) async {
//     var url = "https://thinvest.com/api/trade";
//     var token = HiveBoxes.userBox.values.first.apiToken!;
//     // var response = await http.get(Uri.parse(url));
//
//     final response = await http.get(Uri.parse(url), headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     print(response);
//     if (response.statusCode == 200) {
//
//       var results = jsonDecode(response.body);
//       List<TradesModel> arrData = [];
//       int? a = 0;
//       for (var result in results) {
//         var model = TradesModel.fromMap(result);
//         print(HiveBoxes.userBox.values.first.id.toString() + 'aaaaaa');
//
//         if(HiveBoxes.userBox.values.first.id == model.userId){
//           a =  model.id;
//           arrData.add(model);
//         }
//       }
//
//       print(HiveBoxes.userBox.values.first.id);
//       print(arrData.length);
//
//       return arrData;
//     } else {
//       print('Something Wrong');
//       throw Exception("Failed to Fetch Data");
//     }
//   }
// }
//
//
//
//
//
//
// FutureBuilder(
// future: getData('a'),
// builder: (BuildContext context,
//     AsyncSnapshot<StatsModel> snapshot) {
// if (snapshot.connectionState !=
// ConnectionState.done) {
// return const Center(
// child: CircularProgressIndicator());
// }
// if (snapshot.hasError) {
// return Text(snapshot.error.toString());
// }
//
// if (snapshot.hasData) {
// var list = snapshot.data!;
// print(list);
//
// return Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Start Cap',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// list.startCap!,
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// const SizedBox(
// height: 4,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Client Since',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// memberSince,
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// const SizedBox(
// height: 4,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Profit/Loss(net)',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// list.profitLossPercentage
//     .toString(),
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// SizedBox(
// height: 4,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Profit Share',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// list.profitShare!,
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// SizedBox(
// height: 4,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Total Deposit',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// list.totalDeposit!,
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// SizedBox(
// height: 4,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// const Text(
// 'Equity',
// style: TextStyle(
// fontWeight: FontWeight.bold),
// ),
// Text(
// list.equity!,
// style: TextStyle(
// color: CColors.textColor),
// ),
// ],
// ),
// ],
// );
// }
// return const Text(
// "Error while calling getData");
// }),
//
