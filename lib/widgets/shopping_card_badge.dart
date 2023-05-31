// ignore_for_file: must_be_immutable
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_texts_styles.dart';

class ShoppingCartBadge extends StatelessWidget {
  ShoppingCartBadge({required this.number, Key? key}) : super(key: key);
  int number;

  @override
  Widget build(BuildContext context) {
    // bool showBadge = false;
    //if(product.)
    return Badge(
      badgeContent: Text(
        number.toString(),
        style: AppTextsStyles.onShoppingCardTextStyle,
      ),
      badgeColor: AppColors.secoundaryColor,
      position: BadgePosition.topEnd(),
      animationType: BadgeAnimationType.scale,
      showBadge: number > 0 ? true : false,
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
