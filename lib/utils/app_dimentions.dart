// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppDimensions {
  static Size _size = WidgetsBinding.instance.window.physicalSize;
  static double _width = _size.width;
  static double _height = _size.height;

  static double smallRadius = _width / 97;
  static double meduimRadius = _width / 90;
  static double bigRadius = _width / 80;

  static double X_Percent_Width(double x) {
    return ((_width * x) / 100);
  }

  static double Y_Percent_height(double y) {
    return ((_height * y) / 100);
  }
}
