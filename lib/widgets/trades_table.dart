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
    return (widget.tradesModel.length == 0)
        ? Center(
            child: Text('No data Found'),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: widget.tradesModel.length,
            itemBuilder: (BuildContext context, int index) {
              var model = widget.tradesModel[index];
              print('widget.tradesModel.length');
              print(model.type);
              var amountWithPoint = double.parse(model.amount.toString());
              if (widget.tradesModel.isEmpty) {
                print('widget Null');
                return Center(
                  child: Text('No Data Found'),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (model.type.toString() == 'B')
                                    ? CColors.green
                                    : Colors.red.withOpacity(.6),
                              ),
                              
                              child: getSubHeading(
                                  (model.type.toString() == 'B') ? 'Buy' : 'Short',
                                  fontSize,
                                  (model.type.toString() == 'B')
                                      ? Colors.white
                                      : Colors.white),
                            ),
                          ),
                        )),
                    Expanded(
                        child: getSubHeading(
                            // '${model.amount.toString()}.00',
                            '€ ${amountWithPoint.toStringAsFixed(2)}',.17, Colors.black)),
                    Expanded(
                        child: Column(
                      children: [
                        // getSubHeading(
                        //     '${model.p1.toString()}  ',
                        //     fontSize,
                        //     (model.type.toString() == 'B')
                        //         ? CColors.green
                        //         : Colors.red.withOpacity(.6)),

                        Container(
                          padding: const EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (model.type.toString() == 'B')
                                ? CColors.green
                                : Colors.red.withOpacity(.6),
                          ),
                          
                          child: getSubHeading(
                              '+ €${model.p1_eur.toString()}',
                              fontSize,
                              (model.type.toString() == 'B')
                                  ? Colors.white
                                  : Colors.white),
                        ),
                        getSubHeading('+ \$${model.p1_usd.toString()}', fontSize,
                            Colors.black),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        getSubHeading(model.trade_date.toString(), fontSize,
                            Colors.black),
                        getSubHeading(model.trade_time.toString(), fontSize,
                            Colors.black),
                      ],
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                ViewAlert(tradesModel: model));
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

  Widget getSubHeading(String txt, double size, Color col) {
    return SizedBox(
      width: screenWidth * size,
      child: Text(txt,
          style: TextStyle(color: col, fontSize: 12),
          textAlign: (txt == 'Buy' || txt == 'Short')
          ? TextAlign.center
          : TextAlign.left,),
    );
  }
}
