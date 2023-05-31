import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';
import '../utils/app_texts_styles.dart';

class EditUserPersonalInfoScreen extends StatefulWidget {
  const EditUserPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditUserPersonalInfoScreen> createState() =>
      _EditUserPersonalInfoScreenState();
}

class _EditUserPersonalInfoScreenState
    extends State<EditUserPersonalInfoScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String phoneNumber = '';
  bool _editNumber = false;

  late PhoneNumber number;
  @override
  void initState() {
    phoneNumber = '+971543955336';
    _emailController.text = "salim.allosh.ofl@gmail.com";
    _phoneController.text = phoneNumber;
    _getNumberInfo();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  _getNumberInfo() async {
    PhoneNumber number2 =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);

    number = number2;

    String parsableNumber = number.parseNumber();
    _phoneController.text = parsableNumber;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDimensions.Y_Percent_height(1),
              ),
              Text(
                "Personal Information ",
                style: AppTextsStyles.onActiveTextStyle1,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: AppDimensions.Y_Percent_height(1.5),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.X_Percent_Width(1.5),
                        vertical: AppDimensions.X_Percent_Width(2.3)),
                    child: Column(children: [
                      ListTile(
                        title: Text(
                          "e-mail",
                          style: AppTextsStyles.onActiveTextStyle,
                        ),
                        subtitle: Text(
                          _emailController.text,
                          style: AppTextsStyles.onActiveTextStyle2,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text(
                          "Phone Number",
                          style: AppTextsStyles.onActiveTextStyle,
                        ),
                        subtitle: Text(
                          _phoneController.text,
                          style: AppTextsStyles.onActiveTextStyle2,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Text(
                                    "Edit Number",
                                    style: AppTextsStyles.drawerTextStyle,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "your number is valid .",
                                        style: AppTextsStyles.onActiveTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "are you sure that you want to change your number.",
                                        style: AppTextsStyles.onActiveTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColorShade2),
                                      ),
                                      child: Text("cancel",
                                          style: AppTextsStyles
                                              .dialogConfirmTextStyle),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                          _editNumber = true;
                                          setState(() {});
                                        },
                                        child: Text(
                                          "confirm",
                                          style: AppTextsStyles
                                              .dialogcancelTextStyle,
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                          child: Chip(
                              label: Text("Edit",
                                  style: AppTextsStyles.onActiveTextStyle),
                              backgroundColor: AppColors.activeColor),
                        ),
                      ),
                      if (_editNumber)
                        Column(
                          children: [
                            InternationalPhoneNumberInput(
                              textFieldController: _phoneController,
                              onInputChanged: (PhoneNumber number) {
                                print(number.phoneNumber);
                              },
                              initialValue: number,
                            ),
                            SizedBox(
                              height: AppDimensions.Y_Percent_height(1),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Confirm"))
                          ],
                        )
                    ]),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
