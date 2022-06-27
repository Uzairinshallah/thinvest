import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/deposit.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/screens/reports_screen.dart';
import 'package:thinvest/screens/support.dart';
import 'package:thinvest/widgets/trades_table.dart';

class TrandesScreen extends StatefulWidget {
  const TrandesScreen({Key? key}) : super(key: key);

  @override
  State<TrandesScreen> createState() => _TrandesScreenState();
}

class _TrandesScreenState extends State<TrandesScreen> {
  var screenWidth, screenHeight;
  String dropdownMonth = 'January';
  String dropdownYear = '2022';

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      drawer: GetDrawer(),
      key: _key,
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      child: SizedBox(width: 50, height: 50, child: Image.asset('assets/icons/drawer.png'))),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Trades',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'A complete list of all the latest trades',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trading period:',
                          style: TextStyle(color: CColors.textColor),
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenWidth * .3,
                              height: screenHeight * .05,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                value: dropdownMonth,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: TextStyle(color: CColors.textColor),
                                underline: const SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownMonth = newValue!;
                                  });
                                },
                                items: <String>[
                                  'January',
                                  'Febuary',
                                  'March',
                                  'April'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Container(
                                width: screenWidth * .2,
                                height: screenHeight * .05,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  value: dropdownYear,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: TextStyle(color: CColors.textColor),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownYear = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '2022',
                                    '2021',
                                    '2020',
                                    '2019'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * .095,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            CColors.buttonOne,
                            CColors.buttonTwo.withOpacity(.8),
                            CColors.buttonThree,
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: getHeading(AppStrings.type)),
                          Expanded(child: getHeading(AppStrings.amount)),
                          Expanded(child: getHeading(AppStrings.usd)),
                          Expanded(child: getHeading(AppStrings.time)),
                          Expanded(child: getHeading('')),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: TradesTable()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHeading(String txt) {
    return Text(txt,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center);
  }

  Widget getSubHeading(String txt, double size, Color col) {
    return SizedBox(
      width: screenWidth * size,
      child: Text(txt,
          style: TextStyle(color: col, fontSize: 12),
          textAlign: TextAlign.left),
    );
  }

// Drawer getDrawer() {
//   return Drawer(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//             height: screenHeight * .27,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 25.0),
//               child: Image.asset('assets/icons/thinvest.png'),
//             )),
//         Padding(
//           padding: const EdgeInsets.only(left: 45.0, right: 45),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               drawerHeading('Dashboard', () {
//                 print('clicked');
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Dashboard()));
//               }),
//               getLine(),
//               drawerHeading('Trades', () {
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => TrandesScreen()));
//               }),
//               getLine(),
//               drawerHeading('Deposits', () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => DepositsScreen()));
//               }),
//               getLine(),
//               drawerHeading('Reports', () {
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ReportsScreen()));
//               }),
//               getLine(),
//               drawerHeading('Support', () {
//                 Navigator.pop(context);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Support()));
//               }),
//             ],
//           ),
//         ),
//         Expanded(child: SizedBox()),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'Logout',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Image.asset('assets/icons/logout.png'),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
//
// Widget drawerHeading(String txt, onTap) {
//   return InkWell(
//     onTap: () {
//       onTap();
//     },
//     child: Text(
//       txt,
//       style: TextStyle(
//         color: CColors.textColor,
//         fontSize: 18,
//       ),
//     ),
//   );
// }
//
// Padding getLine() {
//   return Padding(
//     padding: const EdgeInsets.only(top: 18.0, bottom: 20),
//     child: Container(
//       color: CColors.textColor,
//       height: 1,
//     ),
//   );
// }
}
