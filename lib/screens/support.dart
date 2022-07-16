import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/Extras/functions.dart';
import 'package:thinvest/Extras/hive_boxes.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/getX/app_state.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';

class Support extends StatefulWidget {
  Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var screenWidth, screenHeight;
  double res = 0;

  bool boxValue = false;
  bool boxValue2 = false;
  final controller = Get.put(AppController());
  var topicController = TextEditingController();
  var messageController = TextEditingController();
  List<String> dropDownCategory = [
    'General',
    'Technical',
    'Withdrawal',
    'Other'
  ];
  List<String> dropDownPriority = ['Normal', 'Important', 'High'];
  var selectedCategory = 'General';
  var selectedPriority = 'Normal';
  late final GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    _key = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      drawer: GetDrawer(),
      key: _key,
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/icons/drawer.png'))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Support',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ask a question, or report an issue.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              Text(
                                'A general enquiry',
                                style: TextStyle(
                                    fontSize: 12, color: CColors.textColor),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                activeColor: CColors.buttonOne,
                                value: boxValue2,
                                onChanged: (value) {
                                  setState(() {
                                    boxValue2 = value!;
                                  });
                                },
                              ),
                              Text(
                                'I need Help',
                                style: TextStyle(
                                    fontSize: 12, color: CColors.textColor),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(color: CColors.textColor),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: CColors.buttonOne, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: CColors.textColor),
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: dropDownCategory
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Priority',
                          style: TextStyle(color: CColors.textColor),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: CColors.buttonOne, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: selectedPriority,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: CColors.textColor),
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedPriority = newValue!;
                            });
                          },
                          items: dropDownPriority
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      getTextField('Topic', topicController, 1),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please describe the issue or question in detail. This way we can get back to you as quick as possible',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: CColors.textColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      getTextField('Message', messageController, 8),
                      // Expanded(child: SizedBox()),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            if (topicController.text.isEmpty) {
                              Functions.showSnackBar(
                                  context, 'Please fill out the topic field');
                              return;
                            } else if (messageController.text.isEmpty) {
                              Functions.showSnackBar(context,
                                  'Please fill out the password field');
                              return;
                            }
                            Functions.showLoaderDialog(context);
                            postSupport();
                          },
                          child: Container(
                            width: screenWidth,
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
                              AppStrings.askQuestion,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ClearFields() {
    topicController.clear();
    messageController.clear();
    boxValue = false;
    boxValue2 = false;
  }

  Future<void> postSupport() async {
    var userId = HiveBoxes.userBox.values.first.id!;
    var token = HiveBoxes.userBox.values.first.apiToken!;
    print('${token}idddd');

    var url = "https://thinvest.com/api/support";
    Map<String, dynamic> body = {
      'user_id': userId,
      "category": selectedCategory,
      "priority": selectedPriority,
      "subject": topicController.text,
      "message": messageController.text
    };
    String jsonBody = json.encode(body);
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonBody);

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('200000000000000');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      Functions.showSnackBar(context,
          'Your message has been successfully sent, Our support team will get back to you');
      ClearFields();
      Navigator.pop(context);
      setState(() {});

      // return model;
    } else {
      Functions.showSnackBar(
          context, 'Your request can\'t be record at that moment ');
      Navigator.pop(context);

      print(response.body.toString());
      throw Exception(response.body.toString());
    }
  }

  TextFormField getTextField(
      String hint, TextEditingController controller, int lines) {
    return TextFormField(
      controller: controller,
      minLines: lines,
      maxLines: lines,
      style: TextStyle(
        color: CColors.textColor,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        hintText: hint,
        labelStyle: TextStyle(
          color: CColors.textColor,
          fontSize: 12,
        ),
        fillColor: Colors.black.withOpacity(.06),
        filled: true,
      ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
    );
  }
}
