import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/add_deposit.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/screens/reports_screen.dart';
import 'package:thinvest/screens/support.dart';
import 'package:thinvest/screens/trades_screen.dart';

class DepositsScreen extends StatelessWidget {
  DepositsScreen({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      drawer: GetDrawer(),
      key: _key,

      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        print('aaaaaaaaaa');
                        _key.currentState!.openDrawer();
                      },
                      child: Image.asset('assets/icons/drawerIcon.png')),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Dashboard',
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
              SizedBox(
                height: screenHeight * .08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/icons/plus.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddDeposit()));
                      },
                      child: Text(
                        AppStrings.addDeposit,
                        style: TextStyle(color: CColors.buttonOne),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * .085,
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
                      Expanded(child: getHeading(AppStrings.description)),
                      Expanded(child: getHeading(AppStrings.date)),
                      Expanded(child: getHeading(AppStrings.status)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 230,
                child: ListView.builder(
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
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getSubHeading(
                                        '\$ 40000', CColors.buttonOne),
                                    getSubHeading(AppStrings.bankTransfer,
                                        CColors.textColor)
                                  ]),
                            )),
                            Expanded(
                                child: getSubHeading(
                                    AppStrings.startCapacity, Colors.black)),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: getSubHeading(
                                  '12-33-2022', CColors.textColor),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: getSubHeading('Pending', Colors.redAccent),
                            )),
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

  SizedBox getHeading(String txt) {
    return SizedBox(
      child: Text(txt,
          style: TextStyle(color: Colors.white, fontSize: 13),
          textAlign: TextAlign.center),
    );
  }

  Widget getSubHeading(String txt, Color col) {
    return SizedBox(
      child: Text(txt,
          style: TextStyle(color: col, fontSize: 10),
          textAlign: TextAlign.left),
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
