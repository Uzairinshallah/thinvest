import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/sdp.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/deposit_model.dart';
import 'package:thinvest/widgets/view_alert_deposit.dart';

class DepositTable extends StatelessWidget {
  const DepositTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = NumberFormat("#,###.00", "en_US");
    SDP.init(context);
    double fontSize = SDP.sdp(10);
    print(fontSize);
    return Expanded(
      // height: 230,
      child: FutureBuilder(
          future: getData('a'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(CColors.buttonOne),
              ));
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              var list = snapshot.data!;
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  var model = list[index];
                  var amountPoint = double.parse(model.amount.toString());
                  var amountWithPoint = value.format(amountPoint);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // getSubHeading(
                                  //     model.id.toString(), CColors.buttonOne, fontSize),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          // color: (model.status.toString() == '1')
                                          //     ? CColors.green
                                          //     : Colors.redAccent.withOpacity(.6),
                                          color: CColors.green,
                                        ),
                                        child: Text("+ €$amountWithPoint",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: fontSize),
                                            textAlign: TextAlign.left),
                                      ),
                                      getSubHeading(model.type,
                                          CColors.textColor, fontSize),
                                    ],
                                  )
                                ])),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: getSubHeading(model.deposit_date,
                                  CColors.textColor, fontSize),
                            )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: (model.status.toString() == '1')
                                          ? CColors.green
                                          : Colors.redAccent.withOpacity(.6),
                                    ),
                                    child: getSubHeading(
                                        (model.status.toString() == '1')
                                            ? 'Received'
                                            : 'In Progress',
                                        (model.status.toString() == '1')
                                            ? Colors.white
                                            : Colors.white,
                                        fontSize),
                                  )),
                            )),
                        Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ViewAlertDeposit(
                                          depositModel: model,
                                        ));
                              },
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
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: .5,
                    color: CColors.textColor.withOpacity(.5), // Custom style
                  );
                },
              );
            }
            return const Text("Error while calling getData");
          }),
    );
  }

  Future<List<DepositModel>> getData(context) async {
    var token = HiveBoxes.userBox.values.first.apiToken!;
    var url = "https://thinvest.com/api/deposit";
    // var response = await http.get(Uri.parse(url));
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response);
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      List<DepositModel> arrData = [];
      List<DepositModel> arrDataR = [];
      for (var result in results) {
        var model = DepositModel.fromMap(result);
        if (HiveBoxes.userBox.values.first.id == model.userId) {
          arrData.add(model);
        }
      }

      print(arrData.length);

      arrDataR = arrData.reversed.toList();

      return arrDataR;
    } else {
      print('Something Wrong');
      throw Exception("Failed to Fetch Data");
    }
  }
}

Widget getSubHeading(String txt, Color col, double size) {
  return SizedBox(
    child: Text(txt,
        style: TextStyle(color: col, fontSize: size),
        textAlign: TextAlign.center),
  );
}
