import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:thinvest/Extras/colors.dart';
import 'package:thinvest/Extras/strings.dart';
import 'package:thinvest/getX/signup_state.dart';
import 'package:thinvest/screens/signup_proceed.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var screenHeight, screenWidth;
  final controller = Get.put(Controller());
  var fNameController = TextEditingController();
  var mNameController = TextEditingController();
  var lNameController = TextEditingController();
  var dobController = TextEditingController();
  var email = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var mNumberController = TextEditingController();
  var addressController = TextEditingController();
  var postalCodeController = TextEditingController();
  var cityController = TextEditingController();
  var countryController = TextEditingController();
  var passportController = TextEditingController();
  var identificationNoController = TextEditingController();
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();
  var startingAmountController = TextEditingController();
  var reg_date = DateTime.now();
  String dropdownValue = 'Select';
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void initState() {
    // TODO: implement initState
    controller.state = 0.obs;
    print(controller.state.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: MediaQuery.of(context).padding,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: screenHeight * .20,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Image.asset(
                                'assets/icons/thinvest.png',
                                width: screenWidth * .7,
                              ),
                            )),
                        Text(
                          AppStrings.createAccount,
                          style:
                              TextStyle(color: CColors.textColor, fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                                text: AppStrings.alreadyHaveAnAccount,
                                style: TextStyle(
                                    color: CColors.textColor, fontSize: 13),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: AppStrings.loginHere,
                                      style: TextStyle(
                                          color: CColors.buttonOne,
                                          fontSize: 13),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupPage()),
                                          );
                                        }),
                                ]),
                          ),
                        ),
                        Obx(() {
                          if (controller.state.value == 0) {
                            return perosnalBlock(context);
                          } else if (controller.state.value == 1) {
                            return contactDetails(context);
                          } else {
                            return investmentBlock();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          controller.state.value--;
                        },
                        child: (controller.state.value == 1 ||
                                controller.state.value == 2)
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: CColors.buttonOne,
                                  ),
                                  Text(
                                    AppStrings.previous,
                                    style: TextStyle(
                                        color: CColors.buttonOne, fontSize: 16),
                                  ),
                                ],
                              )
                            : SizedBox()),
                    InkWell(
                        onTap: () {
                          (controller.state.value == 0 ||
                                  controller.state.value == 1)
                              ? controller.state.value++
                              : null;
                        },
                        child: (controller.state.value == 0 ||
                                controller.state.value == 1)
                            ? Row(
                                children: [
                                  InkWell(
                                    child: Text(
                                      AppStrings.next,
                                      style: TextStyle(
                                          color: CColors.buttonOne,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: CColors.buttonOne,
                                  )
                                ],
                              )
                            : CreateAccountBtn(AppStrings.createAccount, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupProceed()),
                                );
                              })),
                  ],
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 10, right: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Container(
                                color: (controller.state.value == 0 ||
                                        controller.state.value == 1 ||
                                        controller.state.value == 2)
                                    ? CColors.buttonOne
                                    : Colors.black.withOpacity(.3),
                                height: 3,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Container(
                                color: (controller.state.value == 1 ||
                                        controller.state.value == 2)
                                    ? CColors.buttonOne
                                    : Colors.black.withOpacity(.3),
                                height: 3,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Container(
                                color: (controller.state.value == 2)
                                    ? CColors.buttonOne
                                    : Colors.black.withOpacity(.3),
                                height: 3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton CreateAccountBtn(String text, onTap()) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
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
          width: screenWidth * .4,
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

  Widget investmentBlock() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 0),
            child: getNotice3(AppStrings.identificationPrimaryInvestment)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: screenWidth * .42,
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
            SizedBox(
                width: screenWidth * .42,
                child: getTextField(AppStrings.identificationNumber,
                    identificationNoController)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: getTextField(AppStrings.password, passportController),
        ),
        getTextField(AppStrings.confirmPassword, cPasswordController),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 2, left: 8),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                AppStrings
                    .thisIsTheAmountYouWantToStartWithThisAnswerIsNotFinalAndIsAlwaysSubjectToChange,
                style: TextStyle(color: CColors.textColor, fontSize: 10),
                textAlign: TextAlign.center,
              )),
        ),
        getTextField('\$ 3000', startingAmountController),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
          child: getNotice(AppStrings.termsAndAgreements),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                activeColor: CColors.buttonOne,
                value: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppStrings.termsAgreements,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                activeColor: CColors.buttonOne,
                value: valuesecond,
                onChanged: (value) {
                  setState(() {
                    valuesecond = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              AppStrings.acceptPolicy,
              style: TextStyle(fontSize: 12),
            ))
          ],
        ),
      ],
    );
  }

  Padding getNotice3(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: CColors.textColor,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text(
                text,
                style: TextStyle(color: CColors.textColor, fontSize: 12),
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

  Widget contactDetails(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 65, left: 30, right: 30, bottom: 21),
          child: getNotice(AppStrings.contactDetails),
        ),
        getTextField(AppStrings.phone, phoneController),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: getTextField(AppStrings.mobileNo, email),
        ),
        getTextField(AppStrings.address, addressController),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * .43,
                child:
                    getTextField(AppStrings.postalCode, postalCodeController),
              ),
              Container(
                width: screenWidth * .43,
                child: getTextField(AppStrings.city, cityController),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 1, left: 8),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                AppStrings.country,
                style: TextStyle(color: CColors.textColor, fontSize: 12),
              )),
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
      ],
    );
  }

  Widget perosnalBlock(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 65, left: 30, right: 30, bottom: 21),
          child: getNotice(AppStrings.personalInformation),
        ),
        getTextField(AppStrings.firstName, fNameController),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 14),
          child: getTextField(AppStrings.middleName, mNameController),
        ),
        getTextField(AppStrings.lastName, lNameController),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 2, left: 4),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Text(
                  AppStrings.dateOfBirth,
                  style: TextStyle(color: CColors.textColor, fontSize: 12),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: CColors.buttonOne, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextButton(
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
                          fontSize: 11,
                        )),
                  ),
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
        getTextField(AppStrings.email, emailController),
      ],
    );
  }

  Widget getNotice(String text) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: CColors.textColor,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
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
    );
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
        suffixIcon:
            SizedBox(height: 50, child: Image.asset('assets/icons/arrows.png')),
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
          return AppStrings.pleaseEnterSomeText;
        }
        return null;
      },
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
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        hintText: hint,
        labelStyle: TextStyle(
          color: CColors.textColor,
          fontSize: 14,
        ),
        fillColor: Colors.black.withOpacity(.06),
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.pleaseEnterSomeText;
        }
        return null;
      },
    );
  }
}
