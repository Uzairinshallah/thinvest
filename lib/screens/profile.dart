import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';

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
            height: screenHeight * .3,
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
                                  Image.asset('assets/icons/arrow_back.png')),
                          Text(
                            AppStrings.goBack.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 4.0, right: 4),
                              child: Image.asset('assets/icons/edit.png')),
                          const Text(
                            'EDIT PROFILE',
                            style: TextStyle(
                              color: Colors.white,
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
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Text(
                      'Demo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Demo@gail.com',
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
                    rightText('10-12-2022'),
                  ],
                ),
                getLineText(AppStrings.contactDetails),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.address),
                    rightText('125 , United Kingdom'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftText(AppStrings.phone),
                      rightText('+44 2070 9735 78'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.mobileNo),
                    rightText('+44 2070 9735 78'),
                  ],
                ),
                getLineText(AppStrings.identificationPrimaryInvestment),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftText(AppStrings.identificationType),
                    rightText('Passport'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftText(AppStrings.identificationNumber),
                      rightText('uk21435'),
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
      style: TextStyle(fontSize: 16),
    );
  }
}
