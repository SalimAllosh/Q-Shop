import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/utils/app_colors.dart';

class AppTextsStyles {
  static final TextStyle header1 = TextStyle(
    color: AppColors.primarylightColor,
  );

  static final TextStyle header = TextStyle(
      color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 25);
  static final TextStyle headerunderLine = TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      decoration: TextDecoration.underline);
  static final TextStyle header2 = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primarylightColor);

  static final TextStyle drawerTextStyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor);

  static final TextStyle onActiveTextStyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static final TextStyle onActiveTextStyle1 = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 20);
  static final TextStyle onActiveTextStyle2 =
      GoogleFonts.lato(color: AppColors.primaryColorShade3, fontSize: 17);

  static final TextStyle drawerMainStorNameTextStyle = GoogleFonts.alexBrush(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 25);

  static final TextStyle onShoppingCardTextStyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 10);
  static final TextStyle snackBarTextStyle = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    color: AppColors.primarylightColor,
  );

  static final TextStyle dialogConfirmTextStyle = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    color: AppColors.primarylightColor,
  );

  static final TextStyle dialogcancelTextStyle = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle splahStartTextStyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold,
      color: AppColors.primarylightColor,
      fontSize: 20);

  static final TextStyle splahHeaderTextStyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 20);

  static final TextStyle splahDescriptionTextStyle =
      GoogleFonts.lato(color: AppColors.primaryColor, fontSize: 20);
}
