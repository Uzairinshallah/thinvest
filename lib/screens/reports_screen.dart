import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/deposit.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/screens/support.dart';
import 'package:thinvest/screens/trades_screen.dart';

class ReportsScreen extends StatefulWidget {
  ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  var screenWidth, screenHeight;
  String dropdownYear = '2000';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      drawer: GetDrawer(),
      key: _key,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        print('aaaaaaaaaa');
                        _key.currentState!.openDrawer();
                      },
                      child: SizedBox(width: 50, height: 50, child: Image.asset('assets/icons/drawer.png'))),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Reports',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Fast and easy a complete overview',
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
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Year:',
                      style: TextStyle(color: CColors.textColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: screenWidth * .2,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26, width: 1),
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
                          items: <String>['2022', '2021', '2020', '2000']
                              .map<DropdownMenuItem<String>>((String value) {
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
                    ),
                  ],
                ),
              ),
              Container(
                height: 600,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth * .85,
                              // height: screenHeight * .18,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CColors.textColor, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Text(
                                              'June 2022',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const Text(
                                                      'LONG',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '1 Trade',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            CColors.textColor,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'SHORT',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '1 Trade',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            CColors.textColor,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    const Text(
                                                      'RETURN',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '15 %',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            CColors.textColor,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0,
                                          bottom: 15,
                                          left: 8,
                                          right: 8),
                                      child: Container(
                                        color: CColors.textColor,
                                        height: .5,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'MONTHLY RETURN',
                                                style: TextStyle(fontSize: 8),
                                              ),
                                              Text(
                                                '+47.232 EUR',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: CColors.green),
                                              ),
                                              Text(
                                                '+47.232 USD',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: CColors.textColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'MONTHLY RETURN',
                                                style: TextStyle(fontSize: 8),
                                              ),
                                              Text(
                                                '+47.232 EUR',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: CColors.green),
                                              ),
                                              Text(
                                                '+47.232 USD',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: CColors.textColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                'DOWNLOAD',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: CColors.buttonOne),
                                              ),
                                              Image.asset(
                                                  'assets/icons/downn.png',
                                                  height: 20,
                                                  width: 20),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Drawer getDrawer(BuildContext context) {
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
