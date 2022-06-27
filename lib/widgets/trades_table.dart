import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/sdp.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:http/http.dart' as http;
import 'package:thinvest/models/trades_model.dart';

class TradesTable extends StatefulWidget {
  TradesTable({Key? key}) : super(key: key);

  @override
  State<TradesTable> createState() => _TradesTableState();
}

class _TradesTableState extends State<TradesTable> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    double fontSize = SDP.sdp(10);
    print(fontSize);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getData('a'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return ListView.builder(
                physics: ScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: getSubHeading(
                              snapshot.data[index].type.toString(),
                              fontSize,
                              CColors.green),
                        )),
                        Expanded(
                            child: getSubHeading(
                                snapshot.data[index].amount.toString(),
                                .17,
                                Colors.black)),
                        Expanded(
                            child: Column(
                          children: [
                            getSubHeading(
                                snapshot.data[index].price.toString(),
                                fontSize,
                                CColors.green),
                            getSubHeading(
                                snapshot.data[index].closing_price.toString(),
                                fontSize,
                                Colors.black),
                          ],
                        )),
                        Expanded(
                            child: getSubHeading(
                                snapshot.data[index].trade_date.toString(),
                                fontSize,
                                Colors.black)),
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
                                  style: const TextStyle(
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
          textAlign: TextAlign.center),
    );
  }

  Future<List<TradesModel>> getData(context) async {
    var url = "https://thinvest.com/api/trade";
    var response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      List<TradesModel> arrData = [];
      for (var result in results) {
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

