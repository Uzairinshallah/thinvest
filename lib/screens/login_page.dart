import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/main.dart';
import 'package:thinvest/models/user_model.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/signup_page.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var screenHeight, screenWidth;
  var emailController = TextEditingController();
  var passController = TextEditingController();

  final Uri _url = Uri.parse('https://flutter.dev');


  login(String email, String pass, BuildContext context) async {
    try {
      Response response =
          await post(Uri.parse('https://thinvest.com/api/login'), body: {
        'email': email,
        'password': pass,
      });

      if (response.statusCode == 200) {
        print('Account created Successfully');
        Functions.showSnackBar(context, 'Login Successfully');

        var data = jsonDecode(response.body);

        var model = UserModel.fromJson(data["data"]);
        HiveBoxes.userBox.put("profile", model);

        // HiveBoxes.userBox.get("profile") != null;
        // HiveBoxes.userBox.delete("profile");
        // print(HiveBoxes.userBox.values.first.firstName);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        return;
      } else {
        Functions.showSnackBar(
          context,
          'Login Failed',
        );
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    emailController.text = '';
    passController.text = '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: screenHeight * .2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Image.asset(
                        'assets/icons/thinvest.png',
                        width: screenWidth * .7,
                      ),
                    )),
                Text(
                  'Login into your account',
                  style: TextStyle(fontSize: 18, color: CColors.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19, left: 10, right: 10),
                  child: getTextField(AppStrings.email, emailController, false),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                  child:
                      getTextField(AppStrings.password, passController, true),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 55.0, left: 10, right: 10),
                  child: loginBtn(AppStrings.signIn, () {
                    if (emailController.text.isEmpty ||
                        passController.text.isEmpty) {
                      Functions.showSnackBar(context,
                          AppStrings.pleaseEnterEmailAndPasswordCorrectly);
                    }
                    login(emailController.text.toString(),
                        passController.text.toString(), context);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RichText(
                    text: TextSpan(
                        text: AppStrings.alreadyHaveAnAccount,
                        style:
                            TextStyle(color: CColors.textColor, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: AppStrings.registerHere,
                              style: TextStyle(
                                  color: CColors.buttonOne, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse('https://thinvest.com/register'));
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SignupPage()),
                                  // );
                                })
                        ]),
                  ),
                ),
                getNotice(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: AppStrings.allOurForexMarket,
                        style:
                            TextStyle(color: CColors.textColor, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: AppStrings.contactUs,
                              style: TextStyle(
                                  color: CColors.buttonOne, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()),
                                  );
                                })
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginBtn(String text, onTap()) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              CColors.buttonOne,
              CColors.buttonTwo,
              CColors.buttonThree
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextField(
      String hint, TextEditingController controller, bool obscure) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(
        color: CColors.textColor,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
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


  Widget getNotice() {
    return Padding(
      padding: EdgeInsets.only(top: 46, left: 30, right: 30, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: CColors.textColor,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                'Notice',
                style: TextStyle(color: CColors.textColor),
              )),
          Expanded(
            child: Container(
              height: 1,
              color: CColors.textColor,
            ),
          )
        ],
      ),
    );
  }

}
