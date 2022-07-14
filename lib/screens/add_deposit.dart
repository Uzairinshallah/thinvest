import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/deposit.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/screens/trades_screen.dart';
import 'package:http/http.dart' as http;


class AddDeposit extends StatefulWidget {
  const AddDeposit({Key? key}) : super(key: key);

  @override
  State<AddDeposit> createState() => _AddDepositState();
}

class _AddDepositState extends State<AddDeposit> {
  var screenWidth, screenHeight;
  bool boxValue = false;
  var deposit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrandesScreen()));
                },
                child: Text(
                  AppStrings.addNewDeposit,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${AppStrings.minimum} : 10.00 EUR',
                style: TextStyle(color: CColors.textColor),
              ),
              SizedBox(
                height: screenHeight * .065,
              ),
              getAmountField('\$ 10.00', deposit),
              SizedBox(
                height: screenHeight * .029,
              ),
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeColor: CColors.buttonOne,
                    value: boxValue,
                    onChanged: (value) {
                      setState(() {
                        boxValue = value!;
                      });
                    },
                  ),
                  Expanded(
                      child: Text(
                    AppStrings.bankTransfer,
                    style: TextStyle(fontSize: 12, color: CColors.textColor),
                  ))
                ],
              ),
              SizedBox(
                height: screenHeight * .029,
              ),
              Text(
                AppStrings
                    .afterRequestingNewDepositOneOfOurTeamMembersWillShortlyContactYouThroughEmailWithFurtherInstructions,
                style: TextStyle(
                  color: CColors.textColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 4.0, right: 4),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DepositsScreen()));
                                },
                                child: Image.asset(
                                  'assets/icons/arrow_back.png',
                                  width: 20,
                                  color: CColors.buttonOne,
                                ))),
                        Text(
                          AppStrings.goBack.toUpperCase(),
                          style: TextStyle(
                            color: CColors.buttonOne,
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if(deposit.text == '' || deposit.text.isEmpty){
                            Functions.showSnackBar(context, 'Deposit Should not be Null');
                          }
                          else if(int.parse(deposit.text) < 10){
                            Functions.showSnackBar(context, 'Deposit Should be more than \$10 ');
                          }
                          else
                            postDeposit();

                          // else if(deposit.text < 10)
                        },
                        child: Container(
                          width: screenWidth * .4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                CColors.buttonOne,
                                CColors.buttonTwo,
                                CColors.buttonThree,
                              ],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            AppStrings.addDeposit,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postDeposit() async {
    var userId = HiveBoxes.userBox.values.first.id!;
    var token = HiveBoxes.userBox.values.first.apiToken!;
    print('${token}idddd');

    var url = "https://thinvest.com/api/deposit?user_id=$userId&amount=$deposit";
    // Map<String, dynamic> body = {'user_id': 2, 'amount': "22"};
    // String jsonBody = json.encode(body);
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: ''
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Functions.showSnackBar(context, 'Deposit submitted successfully');

      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');

      setState(() {});

      // return model;
    } else if (response.statusCode ==400){
      Functions.showSnackBar(context, "Deposit limit reached");
    }
    else {
      print('repose');
      print(response.body.toString());
      throw Exception(response.body.toString());
    }
  }

  Widget getAmountField(
    String hint,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: CColors.textColor,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        // isDense: true,
        // suffixIcon:
        //     SizedBox(height: 50, child: Image.asset('assets/icons/arrows.png')),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        hintText: hint,
        labelStyle: TextStyle(
          color: CColors.textColor,
          fontSize: 12,
        ),
        fillColor: Colors.black.withOpacity(.06),
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}























//
// Future<void> postDeposit() async {
//   var userId = HiveBoxes.userBox.values.first.id!;
//   var token = HiveBoxes.userBox.values.first.apiToken!;
//   print('${token}idddd');
//
//   var url = "https://thinvest.com/api/deposit";
//   Map<String, dynamic> body = {'user_id': 21, 'amount': "22"};
//   String jsonBody = json.encode(body);
//   final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//         'Accept': 'application/json',
//         "Authorization": "Bearer $token"
//       },
//       body: jsonBody
//   );
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     print('200000000000000');
//
//     print('Status code: ${response.statusCode}');
//     print('Body: ${response.body}');
//
//     setState(() {});
//
//     // return model;
//   } else {
//     print('repose');
//     print(response.body.toString());
//     throw Exception(response.body.toString());
//   }
// }

