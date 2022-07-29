import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:http/http.dart' as http;
import 'package:thinvest/models/trades_model.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';
import 'package:thinvest/widgets/trades_table.dart';

class TrandesScreen extends StatefulWidget {
  const TrandesScreen({Key? key}) : super(key: key);

  @override
  State<TrandesScreen> createState() => _TrandesScreenState();
}

class _TrandesScreenState extends State<TrandesScreen> {
  var screenWidth, screenHeight;
  String selectedMonth = 'January';
  String selectedYear = '2022';
  List<TradesModel> tradesList = [];
  var cMonth = DateTime.now().month;
  bool m = false;
  List<String> dropDownYears = [
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022'
  ];
  List<String> dropDownMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void initState() {
    print("jhjhggh");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    if (m == false) {
      selectedMonth = dropDownMonths.elementAt(cMonth - 1);
      m = true;
    }
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
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/icons/drawer.png',
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 8, left: 15, right: 15),
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
                                  value: selectedMonth,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: TextStyle(color: CColors.textColor),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedMonth = newValue!;
                                    });
                                  },
                                  items: dropDownMonths
                                      .map<DropdownMenuItem<String>>(
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
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Container(
                                  width: screenWidth * .2,
                                  height: screenHeight * .05,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    value: selectedYear,
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: TextStyle(color: CColors.textColor),
                                    underline: const SizedBox(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedYear = newValue!;
                                      });
                                    },
                                    items: dropDownYears
                                        .map<DropdownMenuItem<String>>(
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
                            Expanded(child: getHeading(AppStrings.type)),
                            Expanded(child: getHeading(AppStrings.amount)),
                            Expanded(child: getHeading(AppStrings.usd)),
                            Expanded(child: getHeading(AppStrings.time)),
                            Expanded(child: getHeading('')),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: (tradesList.isEmpty)
                            ? Center(
                                child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    CColors.buttonOne),
                              ))
                            : TradesTable(
                                tradesModel: tradesList
                                    .where((element) => checkMonth(element))
                                    .toList())),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeading(String txt) {
    return Padding(
      padding: (txt == 'Type')
          ? EdgeInsets.only(left: 8.0)
          : EdgeInsets.only(left: 0.0),
      child: Text(txt,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.left),
    );
  }

  Widget getSubHeading(String txt, double size, Color col) {
    return SizedBox(
      width: screenWidth * size,
      child: Text(txt,
          style: TextStyle(color: col, fontSize: 12),
          textAlign: TextAlign.left),
    );
  }

  bool checkMonth(TradesModel model) {
    DateTime dt = DateTime.parse(model.trade_date!);
    String checkYear = dt.year.toString();
    int checkMonth = dt.month;
    print(checkMonth);
    print(checkYear);
    return checkYear == selectedYear &&
        checkMonth == dropDownMonths.indexOf(selectedMonth) + 1;
  }

  Future<void> getData() async {
    var url = "https://thinvest.com/api/trade/";
    var token = HiveBoxes.userBox.values.first.apiToken!;
    // var response = await http.get(Uri.parse(url));

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response);
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      tradesList = [];
      for (var result in results) {
        var model = TradesModel.fromMap(result);
        if (HiveBoxes.userBox.values.first.id == model.userId) {
          tradesList.add(model);
        }
        setState(() {});
      }
      print(HiveBoxes.userBox.values.first.id);

      // return tradesModel;
    } else {
      print('Something Wrong');
      throw Exception("Failed to Fetch Data");
    }
  }
}
