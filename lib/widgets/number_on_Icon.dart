// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class NumberOnIcon extends StatelessWidget {
  NumberOnIcon({required this.num, required this.icon, Key? key})
      : super(key: key);

  int num;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return num > 0
        ? Column(
            children: [Text(num.toString()), Icon(icon)],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon)],
          );
  }
}
