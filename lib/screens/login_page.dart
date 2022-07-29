import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/models/user_model.dart';
import 'package:thinvest/screens/dashboard/dashboard.dart';
import 'package:thinvest/screens/signup_page.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  final ChromeSafariBrowser browser = MyChromeSafariBrowser();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var screenHeight, screenWidth;

  var emailController = TextEditingController();

  var passController = TextEditingController();

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  void initState() {
    rootBundle.load('assets/images/flutter-logo.png').then((actionButtonIcon) {
      widget.browser.setActionButton(ChromeSafariBrowserActionButton(
          id: 1,
          description: 'Action Button description',
          icon: actionButtonIcon.buffer.asUint8List(),
          action: (url, title) {
            print('Action Button 1 clicked!');
            print(url);
            print(title);
          }));
    });

    widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
        id: 2,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
          print(url);
          print(title);
        }));
    widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
        id: 3,
        label: 'Custom item menu 2',
        action: (url, title) {
          print('Custom item menu 2 clicked!');
          print(url);
          print(title);
        }));
    super.initState();
  }

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
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (Route<dynamic> route) => false);
        return;
      } else if (response.statusCode == 500) {
        Functions.showSnackBar(
          context,
          'API is not working correctly (Error ${response.statusCode.toString()})',
        );
        print('Failed');
      } else {
        Functions.showSnackBar(
            context, 'Incorrect password or User doesn\'t exist');
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
        padding: MediaQuery.of(context).padding,
        child: Padding(
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
                    padding:
                        const EdgeInsets.only(top: 19, left: 10, right: 10),
                    child:
                        getTextField(AppStrings.email, emailController, false),
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

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsScreen(  )));

                      login(emailController.text.toString(),
                          passController.text.toString(), context);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: RichText(
                      text: TextSpan(
                          text: ' Don\'t have an account? ',
                          style:
                              TextStyle(color: CColors.textColor, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppStrings.registerHere,
                                style: TextStyle(
                                    color: CColors.buttonOne, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await widget.browser.open(
                                        url: Uri.parse(
                                            "https://thinvest.com/register"),
                                        options: ChromeSafariBrowserClassOptions(
                                            android:
                                                AndroidChromeCustomTabsOptions(
                                                    shareState:
                                                        CustomTabsShareState
                                                            .SHARE_STATE_OFF,

                                                    isSingleInstance: false,
                                                    isTrustedWebActivity: false,
                                                    keepAliveEnabled: true),
                                            ios: IOSSafariOptions(
                                                dismissButtonStyle:
                                                    IOSSafariDismissButtonStyle
                                                        .CLOSE,
                                              presentationStyle: IOSUIModalPresentationStyle.POPOVER,
                                            )));


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
