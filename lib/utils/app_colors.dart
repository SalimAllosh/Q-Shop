import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

class AppColors {
  static MaterialColor primaryColor =
      generateMaterialColor(color: const Color(0xff411530));
  static MaterialColor primaryColorShade1 =
      generateMaterialColor(color: const Color(0xff9D8795));
  static MaterialColor primaryColorShade2 =
      generateMaterialColor(color: const Color(0xff85697A));
  static MaterialColor primaryColorShade3 =
      generateMaterialColor(color: const Color(0xff674459));
  static MaterialColor secoundaryColor =
      generateMaterialColor(color: const Color(0xffD1512D));
  static MaterialColor backGroundColor =
      generateMaterialColor(color: const Color(0xffF5E8E4));
  static MaterialColor activeColor =
      generateMaterialColor(color: const Color(0xffF5C7A9));
  static MaterialColor primarylightColor =
      generateMaterialColor(color: const Color(0xffFEFBF6));
  static MaterialColor primarydarkColor =
      generateMaterialColor(color: const Color(0xff2C3333));
  static MaterialColor errorColor =
      generateMaterialColor(color: const Color(0xffFF2626));
  static Color primaryButtonBackGround =
      const Color(0xff411530).withOpacity(0.2);
}
