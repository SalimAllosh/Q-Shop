import 'package:flutter/material.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimentions.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView(
      {required this.imagPath,
      required this.header,
      required this.description,
      Key? key})
      : super(key: key);
  final String imagPath;
  final String header;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.backGroundColor,
          child: Column(
            children: [
              Container(
                height: AppDimensions.Y_Percent_height(18),
                decoration: BoxDecoration(
                  //color: AppColors.primaryColorShade1,
                  image: DecorationImage(
                      image: AssetImage(imagPath), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  header,
                  style: AppTextsStyles.splahHeaderTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: AppTextsStyles.splahDescriptionTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
    );
  }
}
