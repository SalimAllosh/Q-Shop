import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';

import '../utils/app_colors.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userExisted = false;
    print("user info screen getting user ");
    User? user = Provider.of<AuthProvider>(context).getUser();
    if (user != null) {
      _userExisted == true;
    }

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.X_Percent_Width(1)),
        child: ListView(children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  minRadius: AppDimensions.X_Percent_Width(5),
                  maxRadius: AppDimensions.X_Percent_Width(6),
                  backgroundImage: AssetImage("assets/images/shopLogo.png"),
                  backgroundColor: AppColors.activeColor,
                ),
                Chip(
                    labelPadding: EdgeInsets.zero,
                    //padding: EdgeInsets.zero,
                    backgroundColor: AppColors.backGroundColor,
                    label: Icon(Icons.camera_alt_outlined))
              ],
            ),
          ),
          SizedBox(
            height: AppDimensions.Y_Percent_height(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user!.email!,
                textAlign: TextAlign.center,
                style: AppTextsStyles.onActiveTextStyle1,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.getEditUserNameScreenScreen());
                  },
                  icon: Icon(Icons.edit_outlined))
            ],
          ),
          if (user.displayName == null) ...[
            Text(
              "",
              textAlign: TextAlign.center,
              style: AppTextsStyles.onActiveTextStyle2,
            )
          ] else ...[
            Text(
              user.displayName!,
              textAlign: TextAlign.center,
              style: AppTextsStyles.onActiveTextStyle2,
            )
          ],
          SizedBox(
            height: AppDimensions.Y_Percent_height(1.5),
          ),
          Text(
            "My Account",
            style: AppTextsStyles.onActiveTextStyle1,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, AppRoutes.getEditUserPersonalInfoScreen()),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.person_outline_rounded,
                color: AppColors.primaryColorShade3,
              ),
              title: Text(
                "personal Information",
                style: AppTextsStyles.onActiveTextStyle,
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColorShade3,
                  )),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.person_outline_rounded,
              color: AppColors.primaryColorShade3,
            ),
            title: Text(
              "Locations",
              style: AppTextsStyles.onActiveTextStyle,
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColorShade3,
                )),
          ),
          //const Divider(),
          GestureDetector(
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.getSignupScreen(), (route) => false);
            },
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.logout_rounded,
                color: AppColors.primaryColorShade3,
              ),
              title: Text(
                "Logout",
                style: AppTextsStyles.onActiveTextStyle,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
