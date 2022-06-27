import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/dashboard/subs_chart.dart';
import 'package:thinvest/screens/deposit.dart';
import 'package:thinvest/screens/profile.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/widgets/trades_table.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        print('_key');
                        print(_key);
                        _key.currentState!.openDrawer();
                      },
                      child: SizedBox(width: 50, height: 50, child: Image.asset('assets/icons/drawer.png'))),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40.0, left: 15, right: 15),
                      child: Container(
                        width: screenWidth,
                        // height: screenHeight * .20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            CColors.buttonOne,
                            CColors.buttonTwo,
                            CColors.buttonThree
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                    child:
                                        Image.asset('assets/icons/avtar.png')),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                title: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  },
                                  child: const Text(
                                    'Demo Account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: screenWidth * .6,
                                height: .9,
                                color: Colors.white,
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 22.0, top: 8, bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DepositsScreen()));
                                    },
                                    child: const Text(
                                      'This month profit: \$ 896.112',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, bottom: 15, left: 15, right: 15),
                      child: Container(
                        width: screenWidth,
                        // height: screenHeight * .25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.black26, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Start Cap',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Client Since',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Profit/Loss(net)',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Profit Share',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Deposit',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Equity',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$243.23',
                                    style: TextStyle(color: CColors.textColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 15, right: 15),
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
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  value: dropdownMonth,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Container(
                                  width: screenWidth * .2,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    value: dropdownYear,
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
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
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Overview January 2022',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        width: screenWidth * .9,
                        // height: screenHeight * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: CColors.textColor, width: .5)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 15,
                                    color: CColors.green.withOpacity(.5),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.0, right: 4),
                                    child: Text(
                                      'Positive Trades',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 15,
                                    color: Colors.red.withOpacity(.5),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.0, right: 4),
                                    child: Text(
                                      'Negative Trades',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SubsChart(),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * .09,
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
                    Container(height: 230, child: TradesTable()),
                       Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: CColors.textColor.withOpacity(.5)),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.boostYourRevenue,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                AppStrings
                                    .lookingToBoostYourRevenueDueToTheSystemOfLeverageYourRevenueGetsIncreasedRapidly,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CColors.textColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6.0, bottom: 15),
                                child: Text(
                                  '${AppStrings.currentDeposit} 2000',
                                  style: TextStyle(color: CColors.textColor),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: screenWidth * .5,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          CColors.buttonOne,
                                          CColors.buttonTwo,
                                          CColors.buttonThree,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      AppStrings.makeNewDeposit,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            AppStrings.depositAmount,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                          Expanded(
                              child: Text(AppStrings.leverage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14))),
                          Expanded(
                              child: Text(AppStrings.revenue,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)))
                        ],
                      ),
                    ),
                    Container(
                      height: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              '\$12345',
                                              style: TextStyle(
                                                  color: CColors.textColor),
                                            ))),
                                    Expanded(
                                      child: Text(
                                        '765412',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: CColors.textColor),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      'o8765',
                                      textAlign: TextAlign.end,
                                      style:
                                          TextStyle(color: CColors.textColor),
                                    )),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
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
}
