import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';


class SubsChart extends StatefulWidget {
  SubsChart({Key? key}) : super(key: key);

  @override
  State<SubsChart> createState() => _SubsChartState();
}



DateTime? startDate;

class _SubsChartState extends State<SubsChart> {
  late double screenWidth, screenHeight;

  @override
  void initState() {
    // TODO: implement initState

    showingBarGroups.add(makeData(
        1,
        100 ,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;


    return Padding(
        padding: const EdgeInsets.all(20),
        child: subsChart(DateTime.now(), DateTime.now()));
  }



  late List<BarChartGroupData> showingBarGroups = [];

  BarChartGroupData makeData(int x, double y1) {
    return BarChartGroupData(
      barsSpace: 0,
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0,
          color: CColors.green.withOpacity(.5),
          width: 10,
          borderRadius: BorderRadius.zero,
          toY: y1,
        ),
      ],
    );
  }

  Widget subsChart(DateTime startDate, DateTime date) {
    return Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.3)),
        Container(
          height: screenHeight * 0.2,
          width: screenWidth * 0.9,
          // color: CColors.drawerCol,
          child: BarChart(
            BarChartData(
              groupsSpace: 0,
              barTouchData: BarTouchData(
                enabled: true,
              ),
              titlesData: FlTitlesData(
                show: false,
              ),
              borderData: FlBorderData(
                  border: const Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
              )),
              barGroups: showingBarGroups,
              gridData: FlGridData(show: true),
            ),
          ),
        ),
        Container(
            width: double.infinity,
            height: .5,
            color: Colors.black.withOpacity(0.3)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


          ],
        )
        // daysWidget(),
      ],
    );
  }
}
