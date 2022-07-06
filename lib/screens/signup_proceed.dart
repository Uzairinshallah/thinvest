import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';

class SignupProceed extends StatelessWidget {
  SignupProceed({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 100, child: Image.asset('assets/icons/bgt.png')),
                      Image.asset('assets/icons/thinvest.png', width: screenWidth * .7,),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/icons/proceed.png'),
                    getBoldText('Fast execution and deep liquidity'),
                    getText('More than 25,000+ satisfied customers since 2010'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/icons/proceed.png'),
                    getBoldText('More than 12 years of experience'),
                    getText(
                        'Ultra-fast order execution with most orders executed in less than 14ms.'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/icons/proceed.png'),
                    getBoldText('Best spread betting provider'),
                    getText('Always tight spreads & low margins'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () { Get.to(Dashboard()); },
                        child: Text('PROCEED', style: TextStyle(color:  CColors.buttonOne, fontSize: 16),),
                        ),
                        Container(
                          height: 3,
                          width: screenWidth * .22,
                          color: CColors.buttonOne,
                        )
                      ],
                    ),
                    SizedBox(height: 200, child: Image.asset('assets/icons/bgb.png')),

                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text getText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  Widget getBoldText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
