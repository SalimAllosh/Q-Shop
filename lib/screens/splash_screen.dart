import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes/app_routes.dart';
import 'package:shop_app/utils/app_colors.dart';
import 'package:shop_app/utils/app_dimentions.dart';
import 'package:shop_app/utils/app_texts_styles.dart';
import 'package:shop_app/widgets/splash_page_view.dart';

import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController;
  late int _currentPageIndex;
  final List<Widget> _pages = [
    const SplashPageView(
        imagPath: "assets/images/splash1.png",
        header: "Ut enim ad minim veniam, quis nostrud exercitation",
        description:
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"),
    const SplashPageView(
        imagPath: "assets/images/splash2.png",
        header: "Ut enim ad minim veniam",
        description:
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"),
    const SplashPageView(
        imagPath: "assets/images/splash3.png",
        header: "Ut enim ad minim veniam",
        description:
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"),
  ];

  @override
  void initState() {
    _pageController = PageController();
    _currentPageIndex = 0;

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).isLoading;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppDimensions.X_Percent_Width(3)),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: (index) {
                setState(() => _currentPageIndex = index);
              },
            ),
          ),
          PageViewDotIndicator(
              currentItem: _currentPageIndex,
              count: _pages.length,
              unselectedColor: AppColors.primaryColorShade1,
              selectedColor: AppColors.primaryColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _currentPageIndex < 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.getSignupScreen());
                        },
                        child: Text(
                          "Skip >>",
                          style: AppTextsStyles.dialogcancelTextStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                          //_pageController.jumpToPage(_currentPageIndex + 1);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColorShade3)),
                        child: Text(
                          "Next",
                          style: AppTextsStyles.dialogConfirmTextStyle,
                        ),
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.getSignupScreen());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Get Started",
                            style: AppTextsStyles.splahStartTextStyle),
                        SizedBox(
                          width: AppDimensions.X_Percent_Width(2),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.primarylightColor,
                        )
                      ],
                    ),
                  ),
          ),
          SizedBox(
            height: AppDimensions.Y_Percent_height(1.5),
          ),
        ],
      ),
    );
  }
}
