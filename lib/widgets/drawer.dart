import 'package:flutter/material.dart';
import 'package:shop_app/routes/app_routes.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';
import '../utils/app_texts_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: AppDimensions.X_Percent_Width(21),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.primaryColor,
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(AppDimensions.Y_Percent_height(50)),
                  height: AppDimensions.Y_Percent_height(10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/images/shopLogo.png",
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
                Text(
                  "The name of Stor",
                  style: AppTextsStyles.drawerMainStorNameTextStyle,
                ),
              ],
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.pushNamed(
                  context, AppRoutes.getProductOverViewScreen()),
              leading: Icon(
                Icons.integration_instructions,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Our Products",
                style: AppTextsStyles.drawerTextStyle,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart_checkout_sharp,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Current Card",
                style: AppTextsStyles.drawerTextStyle,
              ),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.getCardScreen()),
            ),
            ListTile(
              leading: Icon(
                Icons.receipt,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Previous Orders",
                style: AppTextsStyles.drawerTextStyle,
              ),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.getOrdersScreen()),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.person,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "My account",
                style: AppTextsStyles.drawerTextStyle,
              ),
              onTap: () => Navigator.pushNamed(
                  context, AppRoutes.getUserInformationScreen()),
            ),
            ListTile(
              leading: Icon(
                Icons.co_present_rounded,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "User Products",
                style: AppTextsStyles.drawerTextStyle,
              ),
              onTap: () => Navigator.pushReplacementNamed(
                  context, AppRoutes.getuserProductsScreen()),
            ),
          ],
        ));
  }
}
