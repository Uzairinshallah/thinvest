import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/user_model.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:http/http.dart' as http;


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            // height: screenHeight * .3,
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
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 25, right: 30, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 4.0, right: 4),
                              child:
                                  InkWell(onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                                  }, child: Image.asset('assets/icons/arrow_back.png', width: 20,))),
                          Text(
                            AppStrings.goBack.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.values[4],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 4.0, right: 4),
                              child: Image.asset('assets/icons/edit.png', width: 20)),
                           Text(
                            'EDIT PROFILE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.values[4],

                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/avtar.png'),
                      radius: 40, //Text
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Text(
                      HiveBoxes.userBox.values.first.firstName!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    HiveBoxes.userBox.values.first.email!,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.dateOfBirth),
                    rightText(HiveBoxes.userBox.values.first.dateOfBirth!),
                  ],
                ),
                getLineText(AppStrings.contactDetails),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.address),
                    rightText(HiveBoxes.userBox.values.first.address!),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftText(AppStrings.phone),
                      rightText(HiveBoxes.userBox.values.first.phone!),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.mobileNo),
                    rightText(HiveBoxes.userBox.values.first.phoneMobile!),
                  ],
                ),
                getLineText(AppStrings.identificationPrimaryInvestment),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.identificationType),
                    rightText(HiveBoxes.userBox.values.first.identificationType!),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftText(AppStrings.identificationNumber),
                      rightText(HiveBoxes.userBox.values.first.identificationNumber!),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.password),
                    rightText('*********'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding getLineText(String txt) {
    return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 25),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 1,
                      color: CColors.textColor,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(txt, style: TextStyle(color: CColors.textColor, fontSize: 12),),
                    ),
                    Expanded(child: Container(
                      height: 1,
                      color: CColors.textColor,
                    ))
                  ],
                ),
              );
  }

  Text rightText(String txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 16, color: CColors.textColor),
    );
  }

  Text leftText(String txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.values[4]),
    );
  }



}
