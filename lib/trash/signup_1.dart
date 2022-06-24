import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/getX/signup_state.dart';

class Widget1 extends StatefulWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {

  var screenHeight, screenWidth;
  final controller = Get.put(Controller());
  var email = TextEditingController();
  var reg_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        getNotice('Personal Information'),
        getTextField('First Name', email),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: getTextField('Middle Name', email),
        ),
        getTextField('Last Name', email),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 2, left: 4),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Date of Birth',
                style:
                TextStyle(color: CColors.textColor, fontSize: 12),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: CColors.buttonOne, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                      reg_date != null
                          ? DateFormat('dd-MM-yyyy')
                          .format(reg_date)
                          .toString()
                          : DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      style: TextStyle(
                        color: CColors.textColor,
                        fontSize: 12,
                      )),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.calendar_month,
                      color: CColors.textColor,
                    ),
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                    ).then((date) {
                      setState(() {
                        reg_date = date!;
                      });
                    });
                  },
                )
              ],
            ),
          ),
        ),
        getTextField('Email', email),
      ],
    );

  }

  TextFormField getTextField(
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

  Widget getNotice(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
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
                text,
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
