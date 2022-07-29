import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/add_deposit.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/widgets/deposit_table.dart';

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
        padding: MediaQuery.of(context).padding,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/icons/drawer.png'))),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Deposits',
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
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * .085,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15),
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
                      Expanded(flex: 3, child: getHeading(AppStrings.amount)),
                      Expanded(flex: 3, child: getHeading(AppStrings.date)),
                      Expanded(flex: 3, child: getHeading(AppStrings.status)),
                      Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                ),
              ),
              const DepositTable(),
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
          textAlign: TextAlign.center),
    );
  }
}
