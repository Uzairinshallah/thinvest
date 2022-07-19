import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/sdp.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/trades_model.dart';
import 'package:thinvest/widgets/viewAlert.dart';

class TradesTable extends StatefulWidget {
  // TradesModel? tradesModel;
  List<TradesModel> tradesModel;
  TradesTable({Key? key, required this.tradesModel}) : super(key: key);

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
    return (widget.tradesModel.length == 0) ? Center(child: Text('No data Found'),) : ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.tradesModel.length,
        itemBuilder: (BuildContext context, int index) {
          var model = widget.tradesModel[index];
          print('widget.tradesModel.length');
          print(widget.tradesModel.length);
          if(widget.tradesModel.isEmpty){
            print('widget Null');
            return Center(child: Text('No Data Found'),);
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: getSubHeading(
                          model.type.toString(),
                          fontSize,
                          (model.type == "B") ? CColors.green : Colors.red.withOpacity(.6)),
                    )),
                Expanded(
                    child: getSubHeading(
                        model.amount.toString(),
                        .17,
                        Colors.black)),
                Expanded(
                    child: Column(
                      children: [
                        getSubHeading(
                            '${model.p1_usd.toString()} \$ ',
                            fontSize,
                            (model.type.toString() == 'B')
                                ? CColors.green
                                : Colors.red.withOpacity(.6)),
                        getSubHeading(
                            '${model.p1_eur.toString()} €' , fontSize, Colors.black),
                      ],
                    )),
                Expanded(
                    child: Column(
                      children: [
                        getSubHeading(
                            model.trade_date.toString(),
                            fontSize,
                            Colors.black),
                        getSubHeading(
                            model.trade_time.toString(),
                            fontSize,
                            Colors.black),
                      ],
                    )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context) => ViewAlert(tradesModel :model));

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





}

