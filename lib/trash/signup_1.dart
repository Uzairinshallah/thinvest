// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
// import 'package:thinvest/Extras/colors.dart';
// import 'package:thinvest/getX/signup_state.dart';
//
// class Widget1 extends StatefulWidget {
//   const Widget1({Key? key}) : super(key: key);
//
//   @override
//   State<Widget1> createState() => _Widget1State();
// }
//
// class _Widget1State extends State<Widget1> {
//
//   var screenHeight, screenWidth;
//   final controller = Get.put(Controller());
//   var email = TextEditingController();
//   var reg_date = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         getNotice('Personal Information'),
//         getTextField('First Name', email),
//         Padding(
//           padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//           child: getTextField('Middle Name', email),
//         ),
//         getTextField('Last Name', email),
//         Padding(
//           padding: const EdgeInsets.only(top: 6.0, bottom: 2, left: 4),
//           child: Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 'Date of Birth',
//                 style:
//                 TextStyle(color: CColors.textColor, fontSize: 12),
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Container(
//             width: screenWidth,
//             decoration: BoxDecoration(
//               border: Border.all(color: CColors.buttonOne, width: 1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                       reg_date != null
//                           ? DateFormat('dd-MM-yyyy')
//                           .format(reg_date)
//                           .toString()
//                           : DateFormat('dd-MM-yyyy')
//                           .format(DateTime.now())
//                           .toString(),
//                       style: TextStyle(
//                         color: CColors.textColor,
//                         fontSize: 12,
//                       )),
//                 ),
//                 InkWell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.calendar_month,
//                       color: CColors.textColor,
//                     ),
//                   ),
//                   onTap: () {
//                     showDatePicker(
//                       context: context,
//                       lastDate: DateTime.now(),
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2020),
//                     ).then((date) {
//                       setState(() {
//                         reg_date = date!;
//                       });
//                     });
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//         getTextField('Email', email),
//       ],
//     );
//
//   }
//
//   TextFormField getTextField(
//       String hint,
//       TextEditingController controller,
//       ) {
//     return TextFormField(
//       controller: controller,
//       style: TextStyle(
//         color: CColors.textColor,
//         fontSize: 12,
//       ),
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//         hintText: hint,
//         labelStyle: TextStyle(
//           color: CColors.textColor,
//           fontSize: 12,
//         ),
//         fillColor: Colors.black.withOpacity(.06),
//         filled: true,
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget getNotice(String text) {
//     return Padding(
//       padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 1,
//               color: CColors.textColor,
//             ),
//           ),
//           Padding(
//               padding: EdgeInsets.only(left: 8, right: 8),
//               child: Text(
//                 text,
//                 style: TextStyle(color: CColors.textColor),
//               )),
//           Expanded(
//             child: Container(
//               height: 1,
//               color: CColors.textColor,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:thinvest/Extras/colors.dart';
// import 'package:thinvest/Extras/hive_boxes.dart';
// import 'package:thinvest/Extras/sdp.dart';
// import 'package:thinvest/Extras/strings.dart';
// import 'package:thinvest/models/stats_model.dart';
// import 'package:thinvest/models/trades_model.dart';
// import 'package:thinvest/screens/dashboard/subs_chart.dart';
// import 'package:thinvest/screens/deposit.dart';
// import 'package:thinvest/screens/profile.dart';
// import 'package:thinvest/screens/drawer/get_drawer.dart';
// import 'package:thinvest/widgets/trades_table.dart';
// import 'package:thinvest/widgets/viewAlert.dart';
//
// class Dashboard extends StatefulWidget {
//   Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   var screenWidth, screenHeight;
//   var now = new DateTime.now();
//   String selectedMonth = 'January';
//   String selectedYear = '2022';
//   List<String> dropDownYears = [
//     '2012',
//     '2013',
//     '2014',
//     '2015',
//     '2016',
//     '2017',
//     '2018',
//     '2019',
//     '2020',
//     '2021',
//     '2022'
//   ];
//   List<String> dropDownMonths = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];
//   var date = DateTime.parse(HiveBoxes.userBox.values.first.createdAt!);
//   List<TradesModel> tradesModel = [];
//   List<StatsModel> statsModel = [];
//
//   @override
//   void initState() {
//     getDataTrades();
//     getDataStats();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//     final GlobalKey<ScaffoldState> _key = GlobalKey();
//     var memberSince = "${date.day}-${date.month}-${date.year}";
//     SDP.init(context);
//     double fontSize = SDP.sdp(10);
//
//     return Scaffold(
//       drawer: GetDrawer(),
//       key: _key,
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: 50,
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
//               child: Row(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         print('_key');
//                         print(_key);
//                         _key.currentState!.openDrawer();
//                       },
//                       child: SizedBox(
//                           width: 50,
//                           height: 50,
//                           child: Image.asset('assets/icons/drawer.png'))),
//                   Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Dashboard',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'A complete list of all the latest trades',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                           maxLines: 2,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(top: 40.0, left: 15, right: 15),
//                       child: Container(
//                         width: screenWidth,
//                         // height: screenHeight * .20,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(colors: [
//                             CColors.buttonOne,
//                             CColors.buttonTwo,
//                             CColors.buttonThree
//                           ]),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 15.0),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                     child:
//                                     Image.asset('assets/icons/avtar.png')),
//                                 trailing: const Icon(
//                                   Icons.chevron_right,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                                 title: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Profile()));
//                                   },
//                                   child: const Text(
//                                     'Demo Account',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Container(
//                                 width: screenWidth * .6,
//                                 height: .9,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Align(
//                                 alignment: Alignment.bottomLeft,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 22.0, top: 8, bottom: 15),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   DepositsScreen()));
//                                     },
//                                     child: const Text(
//                                       'This month profit: \$ 896.112',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 25.0, bottom: 15, left: 15, right: 15),
//                       child: Container(
//                         width: screenWidth,
//                         // height: screenHeight * .25,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border:
//                             Border.all(color: Colors.black26, width: 1)),
//                         child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: getStatistics(memberSince)),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsets.only(top: 8.0, left: 15, right: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Trading period:',
//                             style: TextStyle(color: CColors.textColor),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: screenWidth * .3,
//                                 height: screenHeight * .05,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.black26, width: 1),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: DropdownButton<String>(
//                                   value: selectedMonth,
//                                   isExpanded: true,
//                                   icon: const Icon(Icons.arrow_drop_down),
//                                   elevation: 16,
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 13),
//                                   underline: const SizedBox(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectedMonth = newValue!;
//                                     });
//                                   },
//                                   items: dropDownMonths
//                                       .map<DropdownMenuItem<String>>(
//                                           (String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsets.only(left: 8.0),
//                                             child: Text(value),
//                                           ),
//                                         );
//                                       }).toList(),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 4.0),
//                                 child: Container(
//                                   width: screenWidth * .2,
//                                   height: screenHeight * .05,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.black26, width: 1),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: DropdownButton<String>(
//                                     value: selectedYear,
//                                     isExpanded: true,
//                                     icon: const Icon(Icons.arrow_drop_down),
//                                     elevation: 16,
//                                     style: const TextStyle(
//                                         color: Colors.black, fontSize: 13),
//                                     underline: const SizedBox(),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         selectedYear = newValue!;
//                                       });
//                                     },
//                                     items: dropDownYears
//                                         .map<DropdownMenuItem<String>>(
//                                             (String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Padding(
//                                               padding:
//                                               const EdgeInsets.only(left: 8.0),
//                                               child: Text(value),
//                                             ),
//                                           );
//                                         }).toList(),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Padding(
//                         padding: EdgeInsets.all(15),
//                         child: Text(
//                           'Overview January 2022',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     Container(
//                         width: screenWidth * .9,
//                         // height: screenHeight * .3,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                                 color: CColors.textColor, width: .5)),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 15.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: 40,
//                                     height: 15,
//                                     decoration: BoxDecoration(
//                                         color: Colors.green.withOpacity(.5),
//                                         border: Border.all(
//                                             color: Colors.green, width: 1)),
//                                   ),
//                                   const Padding(
//                                     padding:
//                                     EdgeInsets.only(left: 4.0, right: 4),
//                                     child: Text(
//                                       'Positive Trades',
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 40,
//                                     height: 15,
//                                     decoration: BoxDecoration(
//                                         color: Colors.red.withOpacity(.5),
//                                         border: Border.all(
//                                             color: Colors.red, width: 1)),
//                                   ),
//                                   const Padding(
//                                     padding:
//                                     EdgeInsets.only(left: 4.0, right: 4),
//                                     child: Text(
//                                       'Negative Trades',
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SubsChart(),
//                           ],
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0, bottom: 15),
//                       child: Container(
//                         width: screenWidth,
//                         height: screenHeight * .09,
//                         decoration: BoxDecoration(
//                           // borderRadius: BorderRadius.circular(15),
//                           gradient: LinearGradient(
//                             colors: [
//                               CColors.buttonOne,
//                               CColors.buttonTwo.withOpacity(.8),
//                               CColors.buttonThree,
//                             ],
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(child: getHeading(AppStrings.type)),
//                             Expanded(child: getHeading(AppStrings.amount)),
//                             Expanded(child: getHeading(AppStrings.usd)),
//                             Expanded(child: getHeading(AppStrings.time)),
//                             Expanded(child: getHeading('')),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(height: 230, child: getTradesBuilder(fontSize)),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Container(
//                         width: screenWidth,
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 width: 1,
//                                 color: CColors.textColor.withOpacity(.5)),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               topRight: Radius.circular(15),
//                             )),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 AppStrings.boostYourRevenue,
//                                 style: const TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 AppStrings
//                                     .lookingToBoostYourRevenueDueToTheSystemOfLeverageYourRevenueGetsIncreasedRapidly,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: CColors.textColor,
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.only(top: 6.0, bottom: 15),
//                                 child: Text(
//                                   '${AppStrings.currentDeposit} 2000',
//                                   style: TextStyle(color: CColors.textColor),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     width: screenWidth * .5,
//                                     height: 40,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           CColors.buttonOne,
//                                           CColors.buttonTwo,
//                                           CColors.buttonThree,
//                                         ],
//                                       ),
//                                     ),
//                                     child: Center(
//                                         child: Text(
//                                           AppStrings.makeNewDeposit,
//                                           style: const TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.all(15.0),
//                     //   child: Row(
//                     //     children: [
//                     //       Expanded(
//                     //           child: Text(
//                     //         AppStrings.depositAmount,
//                     //         style: const TextStyle(
//                     //             fontWeight: FontWeight.bold, fontSize: 14),
//                     //       )),
//                     //       Expanded(
//                     //           child: Text(AppStrings.leverage,
//                     //               textAlign: TextAlign.center,
//                     //               style: const TextStyle(
//                     //                   fontWeight: FontWeight.bold,
//                     //                   fontSize: 14))),
//                     //       Expanded(
//                     //           child: Text(AppStrings.revenue,
//                     //               textAlign: TextAlign.end,
//                     //               style: const TextStyle(
//                     //                   fontWeight: FontWeight.bold,
//                     //                   fontSize: 14)))
//                     //     ],
//                     //   ),
//                     // ),
//                     // Container(
//                     //   height: 230,
//                     //   child: Padding(
//                     //     padding: const EdgeInsets.all(10.0),
//                     //     child: ListView.builder(
//                     //         physics: ScrollPhysics(),
//                     //         padding: EdgeInsets.zero,
//                     //         itemCount: 5,
//                     //         itemBuilder: (BuildContext context, int index) {
//                     //           return Padding(
//                     //             padding: const EdgeInsets.only(bottom: 4.0),
//                     //             child: Row(
//                     //               children: [
//                     //                 Expanded(
//                     //                     child: Padding(
//                     //                         padding: EdgeInsets.only(left: 8.0),
//                     //                         child: Text(
//                     //                           '\$12345',
//                     //                           style: TextStyle(
//                     //                               color: CColors.textColor),
//                     //                         ))),
//                     //                 Expanded(
//                     //                   child: Text(
//                     //                     '765412',
//                     //                     textAlign: TextAlign.center,
//                     //                     style:
//                     //                         TextStyle(color: CColors.textColor),
//                     //                   ),
//                     //                 ),
//                     //                 Expanded(
//                     //                     child: Text(
//                     //                   'o8765',
//                     //                   textAlign: TextAlign.end,
//                     //                   style:
//                     //                       TextStyle(color: CColors.textColor),
//                     //                 )),
//                     //               ],
//                     //             ),
//                     //           );
//                     //         }),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getTradesBuilder(double fontSize) {
//     print('tradesModel.length');
//     print(tradesModel.length);
//     return  ListView.builder(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: tradesModel.length,
//         itemBuilder: (BuildContext context, int index) {
//           var model = tradesModel[index];
//           // DateTime dt = DateTime.parse(model.trade_date!);
//           // String checkYear = dt.year.toString();
//           // int checkMonth = dt.month;
//           // if(checkYear == selectedYear && checkMonth == dropDownMonths.indexOf(selectedMonth)+1 ){
//           return  Padding(
//             padding: const EdgeInsets.only(bottom: 4.0),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: getSubHeading(
//                           model.type.toString(), fontSize, CColors.green),
//                     )),
//                 Expanded(
//                     child: getSubHeading(
//                         model.amount.toString(), .17, Colors.black)),
//                 Expanded(
//                     child: Column(
//                       children: [
//                         getSubHeading(
//                             model.price.toString(), fontSize, CColors.green),
//                         getSubHeading(
//                             model.closing_price.toString(), fontSize, Colors.black),
//                       ],
//                     )),
//                 Expanded(
//                     child: Column(
//                       children: [
//                         getSubHeading(
//                             model.trade_date.toString(), fontSize, Colors.black),
//                         getSubHeading(
//                             model.trade_time.toString(), fontSize, Colors.black),
//                       ],
//                     )),
//                 Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => ViewAlert(tradesModel: model));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 30,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: CColors.buttonOne),
//                           child: Center(
//                             child: Text(
//                               AppStrings.view,
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 10),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           );
//           // }
//           // else
//           //   {
//           //     return SizedBox();
//           //   }
//         });
//   }
//
//   Widget getStatistics(String memberSince) {
//     if (statsModel.isEmpty) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Start Cap',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               statsModel.first.startCap!,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Client Since',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               memberSince,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Profit/Loss(net)',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               statsModel.first.profitLoss!,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Profit Share',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               statsModel.first.profitShare!,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Total Deposit',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               statsModel.first.totalDeposit!,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Equity',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               statsModel.first.equity!,
//               style: TextStyle(color: CColors.textColor),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget getHeading(String txt) {
//     return Text(txt,
//         style: TextStyle(
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center);
//   }
//
//   Future<void> getDataStats() async {
//     var userId = HiveBoxes.userBox.values.first.id!;
//     var token = HiveBoxes.userBox.values.first.apiToken!;
//     print('${token}idddd');
//
//     var url = "https://thinvest.com/api/statistics/$userId";
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//         'Accept': 'application/json',
//         "Authorization": "Bearer $token"
//       },
//     );
//     print(response.body);
//     if (response.statusCode == 200) {
//       statsModel = [];
//       var results = jsonDecode(response.body);
//       var model = StatsModel.fromMap(results);
//       statsModel.add(model);
//       setState(() {});
//
//       // return model;
//     } else {
//       print('Something Wrong');
//       throw Exception("Failed to Fetch Data");
//     }
//   }
//
//   Future<void> getDataTrades() async {
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
//       var results = jsonDecode(response.body);
//       tradesModel = [];
//       // int? a = 0;
//       for (var result in results) {
//         var model = TradesModel.fromMap(result);
//         if (HiveBoxes.userBox.values.first.id == model.userId) {
//           // a = model.id;
//           DateTime dt = DateTime.parse(model.trade_date!);
//           String checkYear = dt.year.toString();
//           int checkMonth = dt.month;
//           if(checkYear == selectedYear && checkMonth == dropDownMonths.indexOf(selectedMonth)+1 ){
//             tradesModel.add(model);
//           }
//         }
//         setState(() {});
//       }
//
//       // return tradesModel;
//     } else {
//       print('Something Wrong');
//       throw Exception("Failed to Fetch Data");
//     }
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
// }
//
