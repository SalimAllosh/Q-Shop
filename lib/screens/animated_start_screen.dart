import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';

class AnimatedStartScreen extends StatefulWidget {
  const AnimatedStartScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedStartScreen> createState() => _AnimatedStartScreenState();
}

class _AnimatedStartScreenState extends State<AnimatedStartScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {
        User? user =
            Provider.of<AuthProvider>(context, listen: false).getUser();
        if (user != null) {
          print("exested user");
          print(user);
          Navigator.pushReplacementNamed(
              context, AppRoutes.getProductOverViewScreen());
          return;
        }
        Navigator.pushReplacementNamed(context, AppRoutes.getSplashScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingBouncingGrid.square(
            duration: const Duration(seconds: 4),
            size: AppDimensions.X_Percent_Width(30),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/$index.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          LoadingJumpingLine.square(),
        ],
      ),
    );
  }
}
