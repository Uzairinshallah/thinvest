import 'package:flutter/material.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/screens/drawer/get_drawer.dart';

class Support extends StatefulWidget {
  Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var screenWidth, screenHeight;

  bool boxValue = false;
  bool boxValue2 = false;
  var email = TextEditingController();

  var dropdownValue = 'Select';
  var dropdownValue2 = 'Select';

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      drawer: GetDrawer(),
      key: _key,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 15),
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
                  padding: EdgeInsets.only(left: 10),
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
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                              style:
                              TextStyle(fontSize: 12, color: CColors.textColor),
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
                              style:
                              TextStyle(fontSize: 12, color: CColors.textColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Category',
                        style: TextStyle(color: CColors.textColor),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: CColors.buttonOne, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: CColors.textColor),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Select', 'Lahore', 'Karachi', 'Islamabad']
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
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: CColors.buttonOne, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        value: dropdownValue2,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: CColors.textColor),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue2 = newValue!;
                          });
                        },
                        items: <String>['Select', 'Lahore', 'Karachi', 'Islamabad']
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
                    SizedBox(
                      height: 20,
                    ),
                    getTextField('Password', email, 1),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please describe the issue or question in detail. This way we can get back to you as quick as possible',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: CColors.textColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    getTextField('Message', email, 8),
                    // Expanded(child: SizedBox()),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {},
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
              ),
            ),

          ],
        ),
      ),
    );
  }


  TextFormField getTextField(
      String hint, TextEditingController controller, int lines) {
    return TextFormField(
      controller: controller,
      maxLines: lines,
      minLines: lines,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
