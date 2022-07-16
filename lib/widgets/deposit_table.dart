import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/sdp.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/deposit_model.dart';


class DepositTable extends StatelessWidget {
  const DepositTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    double fontSize = SDP.sdp(10);
    print(fontSize);
    return
      Expanded(
        // height: 230,
        child:
        FutureBuilder(
            future: getData('a'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child:  CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(CColors.buttonOne),));
              }
              if (snapshot.hasError) {
                return  Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                var list = snapshot.data!;
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      var model = list[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // getSubHeading(
                                        //     model.id.toString(), CColors.buttonOne, fontSize),
                                        getSubHeading(model.type.toString(),
                                            CColors.textColor, fontSize)
                                      ]),
                                )),
                            Expanded(
                                child: getSubHeading(
                                    model.description.toString(), CColors.textColor, fontSize)),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: getSubHeading(
                                      model.deposit_date, CColors.textColor, fontSize),
                                )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Align(alignment: Alignment.center, child: getSubHeading((model.status.toString() == '1') ? 'Recieved' : 'In Progress', (model.status.toString() == '1') ? CColors.green : Colors.redAccent, fontSize)),
                                )),
                          ],
                        ),
                      );
                    });
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
      for(var result in results){
        var model = DepositModel.fromMap(result);
        if(HiveBoxes.userBox.values.first.id == model.userId){
          arrData.add(model);

        }
      }

      print(arrData.length);

      return arrData;
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


