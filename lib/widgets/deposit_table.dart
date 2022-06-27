import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
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
                return Center(child: const CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return  Text(snapshot.error.toString());
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
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        getSubHeading(
                                            snapshot.data[index].id.toString(), CColors.buttonOne, fontSize),
                                        getSubHeading(snapshot.data[index].type.toString(),
                                            CColors.textColor, fontSize)
                                      ]),
                                )),
                            Expanded(
                                child: getSubHeading(
                                    snapshot.data[index].description.toString(), CColors.textColor, fontSize)),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: getSubHeading(
                                      snapshot.data[index].deposit_date, CColors.textColor, fontSize),
                                )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Align(alignment: Alignment.center, child: getSubHeading(snapshot.data[index].status.toString(), Colors.redAccent, fontSize)),
                                )),
                          ],
                        ),
                      );
                    });
              }
              return const Text("Error while calling getData");
            }),


          // ListView.builder(
          //   physics: ScrollPhysics(),
          //   padding: EdgeInsets.zero,
          //   itemCount: 5,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Padding(
          //       padding: const EdgeInsets.only(bottom: 4.0),
          //       child: Row(
          //         children: [
          //           Expanded(
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 8.0),
          //                 child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       getSubHeading(
          //                           '\$ 40000', CColors.buttonOne),
          //                       getSubHeading(AppStrings.bankTransfer,
          //                           CColors.textColor)
          //                     ]),
          //               )),
          //           Expanded(
          //               child: getSubHeading(
          //                   AppStrings.startCapacity, Colors.black)),
          //           Expanded(
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 6.0),
          //                 child: getSubHeading(
          //                     '12-33-2022', CColors.textColor),
          //               )),
          //           Expanded(
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 8.0),
          //                 child: getSubHeading('Pending', Colors.redAccent),
          //               )),
          //         ],
          //       ),
          //     );
          //   }),
      );

  }

  Future<List<DepositModel>> getData(context) async {
    var url = "https://thinvest.com/api/deposit";
    var response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      List<DepositModel> arrData = [];
      for(var result in results){
        var model = DepositModel.fromMap(result);
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

  Widget getSubHeading(String txt, Color col, double size) {
    return SizedBox(
      child: Text(txt,
          style: TextStyle(color: col, fontSize: size),
          textAlign: TextAlign.center),
    );
  }

//
// FutureBuilder(
// future: getData('a'),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// if (snapshot.connectionState != ConnectionState.done) {
// return const CircularProgressIndicator();
// }
// if (snapshot.hasError) {
// return  Text(snapshot.error.toString());
// }
// if (snapshot.hasData) {
// return ListView.builder(
// physics: ScrollPhysics(),
// padding: EdgeInsets.zero,
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.only(bottom: 4.0),
// child: Row(
// children: [
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// getSubHeading(
// '\$ 40000', CColors.buttonOne),
// getSubHeading(AppStrings.bankTransfer,
// CColors.textColor)
// ]),
// )),
// Expanded(
// child: getSubHeading(
// AppStrings.startCapacity, Colors.black)),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(left: 6.0),
// child: getSubHeading(
// '12-33-2022', CColors.textColor),
// )),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: getSubHeading('Pending', Colors.redAccent),
// )),
// ],
// ),
// );
// })
// }
// return const Text("Error while calling getData");
// });

