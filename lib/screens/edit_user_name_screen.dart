import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';

import '../providers/auth_provider.dart';

class EditUserNameScreen extends StatefulWidget {
  const EditUserNameScreen({Key? key}) : super(key: key);

  @override
  State<EditUserNameScreen> createState() => _EditUserNameScreenState();
}

class _EditUserNameScreenState extends State<EditUserNameScreen> {
  bool _loading = false;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loading = Provider.of<AuthProvider>(context).isLoading;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppDimensions.Y_Percent_height(1),
                ),
                Text(
                  "Edit Username",
                  style: AppTextsStyles.onActiveTextStyle1,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: AppDimensions.Y_Percent_height(1.5),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.X_Percent_Width(1.5),
                              vertical: AppDimensions.X_Percent_Width(2.3)),
                          child: Column(children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "First Name",
                              ),
                              controller: fName,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Last Name",
                              ),
                              controller: lName,
                            ),
                          ]),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Future<String> response = Provider.of<AuthProvider>(
                                    context,
                                    listen: false)
                                .changeUserName("${fName.text} ${lName.text}");
                            if (response.toString() == "success") {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Some Thing whent Error"),
                                  content: Text(response.toString()),
                                  actions: [
                                    Center(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors
                                                          .primaryColorShade3)),
                                          child: Text(
                                            "ok",
                                            style: AppTextsStyles
                                                .dialogConfirmTextStyle,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${fName.text} ${lName.text} has been updated ..",
                                    style: AppTextsStyles.snackBarTextStyle,
                                  ),
                                ),
                              );
                              Navigator.pushReplacementNamed(context,
                                  AppRoutes.getUserInformationScreen());
                            }
                          },
                          child: const Text("Save Changes")),
                    ]),
              ],
            ),
          ),
        ),
        if (_loading == true) LoadingJumpingLine.square(),
      ]),
    );
  }
}
