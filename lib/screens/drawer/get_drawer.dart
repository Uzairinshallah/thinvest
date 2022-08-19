import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/constants.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/main.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/deposit.dart';
import 'package:thinvest/screens/login_page.dart';
import 'package:thinvest/screens/reports_screen.dart';
import 'package:thinvest/screens/support.dart';
import 'package:thinvest/screens/trades_screen.dart';

class GetDrawer extends StatelessWidget {
  GetDrawer({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    print('object');
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: screenHeight * .27,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 60.0, right: 60),
                child: Image.asset(
                  'assets/icons/thinvest.png',
                  width: screenWidth * .6,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerHeading('Dashboard', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }),
                getLine(),
                drawerHeading('Trades', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TrandesScreen()));
                }),
                getLine(),
                drawerHeading('Deposits', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepositsScreen()));
                }),
                // getLine(),
                // drawerHeading('Reports', () {
                //   Navigator.pop(context);
                //   print('report Called');
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => ReportsScreen()));
                // }),
                getLine(),
                drawerHeading('Support', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Support()));
                }),
                getLine(),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 45, bottom: 20),
            child: InkWell(
              onTap: () {
                // HiveBoxes.userBox.delete("profile");
                HiveBoxes.userBox.delete("profile");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
                Functions.showSnackBar(context, 'Log Out Successfully');
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset('assets/icons/logout.png'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding getLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8),
      child: Container(
        color: CColors.textColor,
        height: 1,
      ),
    );
  }

  Widget drawerHeading(String txt, onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: screenHeight * .05,
        width: screenWidth,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            txt,
            style: TextStyle(
              color: CColors.textColor,
              fontSize: 18,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
